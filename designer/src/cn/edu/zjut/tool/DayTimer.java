package cn.edu.zjut.tool;

import java.util.Calendar;
import java.util.Date;
import java.util.Timer;

public class DayTimer {
	    //时间间隔
	    private static final long PERIOD_DAY = 24 * 60 * 60 * 1000;
	    public DayTimer() {
	          Calendar calendar = Calendar.getInstance(); 
	                 
	          /*** 定制每日12:00执行方法 ***/
	          calendar.set(Calendar.HOUR_OF_DAY, 12);
	          calendar.set(Calendar.MINUTE, 10);
	          calendar.set(Calendar.SECOND, 0);
	           
	          Date date=calendar.getTime(); //第一次执行定时任务的时间
	          System.out.println(date);
	          System.out.println("before 方法比较："+date.before(new Date()));
	          //如果第一次执行定时任务的时间 小于 当前的时间
	          //此时要在 第一次执行定时任务的时间 加一天，以便此任务在下个时间点执行。如果不加一天，任务会立即执行。循环执行的周期则以当前时间为准
	          if (date.before(new Date())) {
	              date = this.addDay(date, 1);
	              System.out.println(date);
	          }
	           
	          Timer timer = new Timer();
	           
	          UpdateDataTask task = new UpdateDataTask();
	          //安排指定的任务在指定的时间开始进行重复的固定延迟执行。
	          long tempdelay = 60*1000;
	          long tempcircle = 30*1000;
	          timer.schedule(task,date,PERIOD_DAY);
	         // timer.schedule(task,tempdelay,tempcircle);
	         }
	 
	         // 增加或减少天数
	         public Date addDay(Date date, int num) {
	        	 Calendar startDT = Calendar.getInstance();
	        	 startDT.setTime(date);
	        	 startDT.add(Calendar.DAY_OF_MONTH, num);
	        	 return startDT.getTime();
	         }
	}