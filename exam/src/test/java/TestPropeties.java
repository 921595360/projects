import java.io.IOException;
import java.util.Properties;

public class TestPropeties {


    public static void main(String[] args) {

        Properties properties = new Properties();

        try {
            //加载资源文件
            properties.load(TestPropeties.class.getResourceAsStream("/db.properties"));

            System.out.println( properties.get("url"));;
        } catch (IOException e) {

        }


    }

}