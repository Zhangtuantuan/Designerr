package cn.edu.zjut.tool;

import java.util.List;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import cn.edu.zjut.dao.DesignerDAO;
import cn.edu.zjut.dao.ExampleDAO;
import cn.edu.zjut.po.Designer;
import cn.edu.zjut.po.Example;

@Component
public class ATask{

       @Scheduled(cron="0 0 1 ? * SUN")   //每周星期天凌晨1点实行一次       
       public void aTask(){ 
    	DesignerDAO designerDAO=new DesignerDAO();
    	Designer designer;
    	String hql = "from cn.edu.zjut.po.Designer";
   		List designers = designerDAO.findByHql(hql);
        for(int i=0;i<designers.size();i++) {
        	designer=(Designer)designers.get(i);
        	designer.setVisits(0);
        	if(designer.getStatus1()==2 || designer.getStatus1()==4) {
        		designer.setStatus1(0);
        	}
        }
        ExampleDAO exampleDAO=new ExampleDAO();
    	Example example;
    	hql = "from cn.edu.zjut.po.Example";
   		List examples = exampleDAO.findByHql(hql);
        for(int i=0;i<examples.size();i++) {
        	example=(Example)examples.get(i);
        	example.setVisits(0);
        }
       }    

}  
