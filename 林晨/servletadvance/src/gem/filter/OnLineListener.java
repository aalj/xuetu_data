package gem.filter;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Application Lifecycle Listener implementation class OnLineListener
 *
 */
public class OnLineListener implements HttpSessionListener {

    /**
     * Default constructor. 
     */
    public OnLineListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
     */
    public void sessionCreated(HttpSessionEvent arg0)  { 
         // 有Session对象被创建时，
    	System.out.println("session created");
    	//在线人数加1
    	OnLineCount.inc();
    }

	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent arg0)  { 
         // destroy ssession对象时
    	System.out.println("session destroy");
    	//在线人数减1
    	OnLineCount.dec();
    	
    	
    }
	
}
