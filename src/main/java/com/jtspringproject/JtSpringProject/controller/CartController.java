package com.jtspringproject.JtSpringProject.controller;

import com.jtspringproject.JtSpringProject.models.Cart;
import com.jtspringproject.JtSpringProject.models.CartProduct;
import com.jtspringproject.JtSpringProject.models.Product;
import com.jtspringproject.JtSpringProject.models.User;
import com.jtspringproject.JtSpringProject.services.cartService;
import com.jtspringproject.JtSpringProject.services.productService;
import com.jtspringproject.JtSpringProject.services.userService;
import com.jtspringproject.JtSpringProject.dao.cartProductDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/cart")
public class CartController {

    private final cartService cartService;
    private final productService productService;
    private final userService userService;
    private final cartProductDao cartProductDao;

    @Autowired
    public CartController(cartService cartService, productService productService,
                          userService userService, cartProductDao cartProductDao) {
        this.cartService = cartService;
        this.productService = productService;
        this.userService = userService;
        this.cartProductDao = cartProductDao;
    }

    /**
     * Display the cart for the currently logged-in user.
     * Finds (or lazily creates) a cart for the user, then lists its products.
     */
    @GetMapping({"", "/"})
    public ModelAndView viewCart() {
        ModelAndView mView = new ModelAndView("cartproduct");
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        User user = userService.getUserByUsername(username);

        // Find or create a cart for this user
        Cart cart = getOrCreateCartForUser(user);

        List<Product> cartProducts = cartProductDao.getProductByCartID(cart.getId());
        int total = cartProducts.stream().mapToInt(Product::getPrice).sum();

        mView.addObject("cartProducts", cartProducts);
        mView.addObject("total", total);
        mView.addObject("username", username);
        return mView;
    }

    /**
     * Add a product to the logged-in user's cart, then redirect to the cart page.
     */
    @GetMapping("/add")
    public String addToCart(@RequestParam("id") int productId) {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        User user = userService.getUserByUsername(username);
        Product product = productService.getProduct(productId);

        if (product == null) {
            return "redirect:/cart";
        }

        Cart cart = getOrCreateCartForUser(user);

        // Check if product already in cart (avoid duplicates)
        List<Product> existing = cartProductDao.getProductByCartID(cart.getId());
        boolean alreadyInCart = existing.stream().anyMatch(p -> p.getId() == productId);

        if (!alreadyInCart) {
            CartProduct cartProduct = new CartProduct(cart, product);
            cartProductDao.addCartProduct(cartProduct);
        }

        return "redirect:/cart";
    }

    /**
     * Remove a specific product from the user's cart.
     */
    @GetMapping("/remove")
    public String removeFromCart(@RequestParam("productId") int productId) {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        User user = userService.getUserByUsername(username);
        Cart cart = getOrCreateCartForUser(user);

        List<CartProduct> allCartProducts = cartProductDao.getCartProducts();
        allCartProducts.stream()
                .filter(cp -> cp.getCart().getId() == cart.getId()
                        && cp.getProduct().getId() == productId)
                .findFirst()
                .ifPresent(cartProductDao::deleteCartProduct);

        return "redirect:/cart";
    }

    /**
     * Helper: find the existing cart for a user, or create a new one.
     */
    private Cart getOrCreateCartForUser(User user) {
        List<Cart> allCarts = cartService.getCarts();
        return allCarts.stream()
                .filter(c -> c.getCustomer() != null && c.getCustomer().getId() == user.getId())
                .findFirst()
                .orElseGet(() -> {
                    Cart newCart = new Cart();
                    newCart.setCustomer(user);
                    return cartService.addCart(newCart);
                });
    }
}
