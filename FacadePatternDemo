public class FacadePatternDemo {
  
  private HotelOrderService hotelService;
  private PaymentService paymentService;
  private DeliveryProvider deliveryProvider; 

  public FacadePatternDemo() {
    hotelService = new HotelOrderService();
    paymentService = new PaymentService();
    deliveryProvider = new SwiggyProvider();
  }

  public void placeOrder(Order order, CreditCard card) {

    // Facade handles interactions internally

    hotelService.createOrder(order);

    Payment payment = paymentService.createPayment(card);

    deliveryProvider.generateBill(order, payment);

    deliveryProvider.schedulePickup(order);

  }

}
//Call the placeOrder method
FacadePatternDemo facadeObj = new FacadePatternDemo();
facadeObj.placeOrder(order, card);
