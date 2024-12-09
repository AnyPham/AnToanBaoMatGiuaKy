package service;

import java.util.Random;

public class OTPGenerator {

    public static String generateOTP() {
        int otpLength = 6;
        StringBuilder otp = new StringBuilder();
        String allowedChars = "0123456789";
        Random random = new Random();

        // tạo mã otp ngẫu nhiên
        for (int i = 0; i < otpLength; i++) {
            int index = random.nextInt(allowedChars.length());
            char randomChar = allowedChars.charAt(index);
            otp.append(randomChar);
        }

        return otp.toString();
    }

    public static void main(String[] args) {
        String generatedOTP = generateOTP();
        System.out.println("Generated OTP: " + generatedOTP);
    }
}

