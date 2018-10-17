import com.chinasofti.pojo.*;
import com.chinasofti.pojo.User;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;

import java.util.List;

@ContextConfiguration("classpath:beans.xml")
public class TestJdbcTemplate extends AbstractJUnit4SpringContextTests{

    @Autowired
    private JdbcTemplate jdbcTemplate;


    /**
     * 数据库增删改
     */
    @Test
    public void testUpdate(){
        jdbcTemplate.update("delete from t_user where user_name =?","张三");
    }

    @Test
    public void testSelect(){
        //根据实体属性名称与数据库列匹配
        List<User> users = jdbcTemplate.query("select * from t_user", new BeanPropertyRowMapper<User>(User.class));


        Integer integer = jdbcTemplate.queryForObject("select count(0) from t_user", Integer.class);
    }

}