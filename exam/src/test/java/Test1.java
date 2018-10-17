import org.junit.Test;

import java.lang.reflect.Field;

public class Test1 {

    /**
     * 修改变量本身引用，原有变量不变，
     * 修改对象的属性，原对象的属性改变
     */
    @Test
    public void test1(){
        String a="a";
        System.out.println("修改前hash:"+a.hashCode());
        change(a);
        System.out.println("修改后hash:"+a.hashCode());
    }










    public void change(Menu a){
        a.name="系统设置1";
    }

    public void change(String a){
        try {
            Field hash = a.getClass().getDeclaredField("hash");
            hash.setAccessible(true);
            hash.set(a,88);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }



}


class Menu{
    public String name;

    @Override
    public String toString() {
        return "Menu{" +
                "name='" + name + '\'' +
                '}';
    }
}
