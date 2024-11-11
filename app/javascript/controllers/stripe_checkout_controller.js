import { Controller } from "@hotwired/stimulus";
import { post } from "@rails/request.js"

// Connects to data-controller="stripe-checkout"
export default class extends Controller {
  static values = { url: String }

  async connect() {
    if (this.checkout) return;
    let publicKey = document.head.querySelector("meta[name='stripe-public-key']").content
    const stripe = Stripe(publicKey);
    const fetchClientSecret = async () => {
      // Make a POST request to the provided URL
      const response = await post(this.urlValue);
      const { clientSecret } = await response.json; // Await the JSON response and extract the clientSecret
      return clientSecret;
    };
    
  
    this.checkout = await stripe.initEmbeddedCheckout({
      fetchClientSecret,
    });
  
    // Mount Checkout
    this.checkout.mount(this.element);
  }

  async disconnect () {
      if (this.checkout) {
        this.checkout.unmount();
        this.checkout = null; // Clean up after unmount
    }
  }
}
