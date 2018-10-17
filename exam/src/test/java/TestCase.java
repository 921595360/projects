import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;

import com.chinasofti.exception.TipException;
import com.chinasofti.pojo.Exam;
import com.chinasofti.service.ExamService;
import org.springframework.test.context.web.WebAppConfiguration;

@ContextConfiguration("classpath:spring-mvc.xml")
@WebAppConfiguration
public class TestCase extends AbstractJUnit4SpringContextTests{

    @Autowired
    private ExamService examService;

    @Test
    public void test(){
    	Exam exam = new Exam();
    	exam.setBeginTime("开始");
    	exam.setNeedTime(200);
    	exam.setTitle("测试考试");
    	try {
			examService.add(exam);
		} catch (TipException e) {
			e.printStackTrace();
		}
    }

	@Test
	public void testList() throws Exception {
		examService.list();
		examService.list();

		Thread.sleep(8*1000);

		examService.list();
	}

}
