import com.chinasofti.pojo.*;
import com.chinasofti.pojo.User;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

public class TestOver {

    /**
     * 堆溢出
     */
    @Test
    public void testHeap(){
        List<Object> obj=new ArrayList<>();
            for(int i=0;;i++){
                obj.add(new User());
            }

    }


}