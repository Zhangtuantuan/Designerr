package com.alipay.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016092200571876";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCS6vr7bOKLMi55eMxDuzoJDbk04MQRbeD6V+sFAWGhlyN4lKqDmFWYpmmXaVKPD8FRym4gNc4YE5zLIovSt2NEUDQChWfMrTy8Cc617kF88uJXvoJH9qwQE5vjfM2J2Bnu+ve0exCDh5z3bOdJRJsBFOb1QJ5oY8gA92kElUmd4noy9SKkar2I8YcXuNPecMTdPfkwhQao/QKatNqOGtbtPUOj/NLnZXrc9zyznnMTzRLItkQ8N//pH4QpRiCV3eSPRWcDbMIeAhj1v22r8bcOsSDF1Xpb+akvVBjtB9yLq4fsuAqWwFT1+9MWSdwSnzoobDIrV3KA1PPpOoxeVTTDAgMBAAECggEAIstVz2/VI0QqL4iFT9EqiHRglX5Z0QrlykRCG7hdB+kEdI046NuOAg3/WeWOsOT5UsaPWD+F5LvYWV+AH9Jgxw/7kVFI6PdqN9pWw01+4vme00sCDcsEqvYJ6FFpWCj+01NKkMrIeW4Hpa18BSUjVJk/rXu1SGHBP0FY9MXqXmKlik0iVBrx9KO11RrpEUDsLLuv0KzTRzISf8yx2cepxvzCv5njpQ7SR9IwzrfLJKhj+fP2EAfFQKFOxhSNQDxO3Z98JR12jLM7dPrv+Rkg1j0dVKkXigHz92F+SlHKu5r11DSUVp8eipllTcN62LisqKhWj35YHKzYuauj3UjtIQKBgQDR52fu4t5Os4Yo2VWrrObuKEMMdfxHt1Q1PhAiaL5qUdlNZekjqSvGI60CXGx6gq9zEMIq3iRJB3zrcjHKQM+G+E8G9V2kytQb6TBEmf54nkUEbx1WJswUUOwfZlXO4WorypTlfgu5JTuZ2N0BiFiNbRfKFT0HtQrcFYem+fWAEQKBgQCzLo+VWIc0Ert4fQS6LWHVjt2GFPWBs8TYvqVzaJTKciWrUl7G1H4Zn0WAE+xzs7X7pjUNJU7jsDoeRoEGmtUD2SEyaB8eeg8gQoD+N/uwlikvn6oRpoxWtvZBaL3QBXAhDMVm2plPCqDrhMOu8Znc9D/zYQ1xbR2k21RUEQz7kwKBgFviAA0CIm4xB7k56daMiUoXNcJuo1CBX8sur8FgOHox+f13bua9VvwVAdbWvmWib0rfOx+ovhl5vaUTB9iRJkbeyzkwjx1j7BWLriVZg5spLO0T9rOPqCX8hl/4W/eDlQY2V5dd5aPWOJDP7W6OULUX3CIJyf1lsqtEgW0GXgEBAoGAdLpSY5KGkc/aPUYEfFzwLTWi7qRcw6AfDqw0EJkCxVfTXmaMw67Ob1ao6iUQltduKIBAc03otL+rPOnlSC45swYScEoQa8RMclGgwvwphQJt1k6HdnQvXJZYmofnj8rbH0y4lKa31RwxdPzKlf9iouSjfKOvJENXWnxf1Vw+Pu0CgYB0YhyjBuUOeqmHvXMcdlkYOKewBb6XJsNd6mukvSExcKYdWYgBlGmk4o9ahQ2svM9112LBmtB0CkaGiG8D220EG8/SxGh1JPwe/V2Z1SSnU5o0L7LUaZOVezfw90SpUSKP7TxzCeFTMf/OavCKncdvlmIOl4MIjslH3ON+8ri8kg==";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApebpFmnx3PfW4MbLhqlHubakb4wpvkpRSyExzVgacpaci2+YuW7FeLXkXa72nnth3dwDMLEX57G3z7Ca3O7vKC5VcexO5GUhlVgIdqeOsqcSnlBQPIw1ZGs+wyJnDi4ftTIJfj8ZJsp6ryqR4NCmjPuuEM7Gb7y3xXdyG9w/5hnaBvAgMHVd7XfcmzKmSxIZwI560pkmMI6LIREl2hXgsIKby8a02WYus3cl/Ftc+MHtueN5QFNuC5az9EaR36/6yx9gZrMU/OIK3RqhRgr5rkFfZHgD2p5jzWUkXDILtk0j5NTmbLKqNQd1o2A9NKlh2Cy+0rF0YQ6Av/TemzdmkQIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://dqmshh.natappfree.cc/designe3.0/paySuccess.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://dqmshh.natappfree.cc/designer3.0/paySuccess.jsp";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

