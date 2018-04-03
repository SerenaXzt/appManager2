package cn.app.exceptionhandler;

import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class DefaultExceptionHandler {

	@ExceptionHandler({HttpRequestMethodNotSupportedException.class})
	public ModelAndView getOrMethod(Exception e){
		System.out.println("============="+e.getMessage());
		ModelAndView view = new ModelAndView("redirect:/appsInfo");
		return view;
	}
}
