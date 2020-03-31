package cn.shop.exception;

public class UnEnoughAmountException extends Exception {
    public UnEnoughAmountException(String msg) {
        super(msg);
    }
}
