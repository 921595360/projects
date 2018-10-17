import com.chinasofti.ser.User;

import java.io.*;

public class TestSer {
    public static void main(String[] args) {
      Ser();

    }

    private static void fan() {
        //反序列化
        try {
            FileInputStream is = new FileInputStream("D:/user.txt");
            ObjectInputStream objIs = new ObjectInputStream(is);
            //从文件中读取对象
            User user= (User) objIs.readObject();
            System.out.println(user);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    /**
     * 序列化
     */
    private static void Ser() {
        User user = new User("张三");
        //将对象序列化到硬盘
        try {
            FileOutputStream os = new FileOutputStream("D:/user.txt");
            ObjectOutputStream objOs = new ObjectOutputStream(os);
            //将对象输出到文件中
            objOs.writeObject(user);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}