package cn.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5Code {
      
    // 全局数组  
    private final static String[] strDigits = { "0", "1", "2", "3", "4", "5",  
            "6", "7", "8", "9", "A", "B", "C", "D", "E", "F" };  
  
    public MD5Code() {
    }  
  
    // 返回形式为数字跟字符串  
    private static String byteToArrayString(byte bByte) {  
        int iRet = bByte;  
        // System.out.println("iRet="+iRet);  
        if (iRet < 0) {  
            iRet += 256;  
        }  
        int iD1 = iRet / 16;  
        int iD2 = iRet % 16;  
        return strDigits[iD1] + strDigits[iD2];  
    }
  
    // 返回形式只为数字  
    private static String byteToNum(byte bByte) {  
        int iRet = bByte;  
        System.out.println("iRet1=" + iRet);  
        if (iRet < 0) {  
            iRet += 256;  
        }  
        return String.valueOf(iRet);  
    }  
  
    // 转换字节数组为16进制字串  
    private static String byteToString(byte[] bByte) {  
        StringBuffer sBuffer = new StringBuffer();  
        for (int i = 0; i < bByte.length; i++) {  
            sBuffer.append(byteToArrayString(bByte[i]));  
        }  
        return sBuffer.toString();  
    }
    /**
     * 生成md5校验码
     * @param strObj	用户输入的密码
     * @return
     */
    public static String GetMD5Code(String strObj) {  
        String resultString = null;  
        try {  
            resultString = new String(strObj);  
            MessageDigest md = MessageDigest.getInstance("MD5");  
            // md.digest() 该函数返回值为存放哈希值结果的byte数组  
            resultString = byteToString(md.digest(strObj.getBytes()));  
        } catch (NoSuchAlgorithmException ex) {  
            ex.printStackTrace();  
        }  
        return resultString;  
    }
    
    /** 
     * 判断字符串的md5校验码是否与一个已知的md5码相匹配 
     *  
     * @param password 要校验的字符串 
     * @param md5PwdStr 已知的md5校验码 
     * @return 
     */  
    public static boolean checkPassword(String password, String md5PwdStr) {  
        String s = GetMD5Code(password);  
        return s.equals(md5PwdStr);  
    }

}  