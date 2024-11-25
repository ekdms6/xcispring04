package net.developia.aop;

import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import lombok.extern.log4j.Log4j;

@Aspect
@Log4j
@Component
public class SystemLogAdvice {
	
	@AfterThrowing(
			pointcut = "execution(* net.developia.service.BoardService*.*(..))", 
			throwing="exception")
	public void logException(Exception exception) {
		log.error("---------------------------");
		log.error("-- @AfterThrowing advice --");
		log.error("---------------------------");
		log.error("exception: " + exception.getMessage());
	}

}
