import org.junit.Test;

public class TestGC {


    @Test
    public void test(){


        for(int i=0;i<1000000;i++){
           User user= new User();
        }


        //调用gc回收对象
        System.gc();

    }
}


class User{

    @Override
    protected void finalize() throws Throwable {
        System.out.println("对象销毁了。。。。。");
    }
}