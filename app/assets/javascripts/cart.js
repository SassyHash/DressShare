var Store = (function () {

  function CartController() {
    var self = this;

    this.loadCart = function() {
      $.get(
        '/users/1/cart',
        self.renderCart
      );
    };

    this.handleLoadCart = function(product_hash) {
      self.renderCart(product_hash);

    };

    // this.handleAddToCart = function (products) {

    // };

    this.renderCart = function(product_hash) {
      $("#cart ul").html("");
      _.each(product_hash, function (value, key) {
          $('#cart ul').append(
            $('<li>'+ value.label+ "  $" + value.price + " "+ value.quantity+'</li>')
          )
      });
    };

  };

  return {
    CartController: CartController
  };
})();