package com.myspring.FinalProject.common.log;

import java.util.Arrays;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;


/* Log
 * 1. 리소스 낭비 방지
 * 2. 에러 원인 찾기 쉽도록!!
 * 3. 성능 향상*/
@Component
@Aspect
public class LoggingAdvice {
	private static final Logger logger = LoggerFactory.getLogger(LoggingAdvice.class);

	// target 메소드의 파라미터 등 정보를 출력(로그레벨 
	@Before("execution(* com.finalProject.*.service.*.*(..)) or "
			+ "execution(* com.finalProject.*.dao.*.*(..))")
	public void startLog(JoinPoint jp) {

		logger.info("-------------------------------------");
		logger.info("-------------------------------------");

		// 전달되는 모든 파라미터들을 Object의 배열로 가져옴 
		logger.info("1:" + Arrays.toString(jp.getArgs()));
		// 해당 Advice의 타입을 알아냄 
		logger.info("2:" + jp.getKind());
		// 실행하는 대상 객체의 메소드에 대한 정보를 알아낼 때 사용..
		logger.info("3:" + jp.getSignature().getName());
		// target객체를 알아낼 때 사용
		logger.info("4:" + jp.getTarget().toString());
		// Adivce를 행하는 객체를 알아낼 때 사용.
		logger.info("5:" + jp.getThis().toString());
	}
	
	@After("execution(* com.finalProject.*.service.*.*(..)) or "
			+ "execution(* com.finalProject.*.*.dao.*.*(..))")
	public void after(JoinPoint jp) { 
		logger.info("-------------------------------------");
		logger.info("-------------------------------------");
		// 전달되는 모든 파라미터들을 Object의 배열로 가져옴..
		logger.info("1:" + Arrays.toString(jp.getArgs()));
		// 해당 Advice의 타입을 알아냄.
		logger.info("2:" + jp.getKind());
		// 실핼하는 대상 객체의 메소드에 대한 정보를 알아낼 때 사용.
		logger.info("3:" + jp.getSignature().getName());
		// target객체를 알아낼 때 사용. 
		logger.info("4:" + jp.getTarget().toString());
		// Advice를 행하는 객체를 알아낼 때 사용.
		logger.info("5:" + jp.getThis().toString());
	}

	// target 메소드의 동작 시간을 측정..
	@Around("execution(* com.finalProject.*.service.*.*(..)) or "
			+ "execution(* com.finalProject.*.dao.*.*(..))")
	public Object timeLog(ProceedingJoinPoint pjp) throws Throwable {
		long startTime = System.currentTimeMillis();
		logger.info(Arrays.toString(pjp.getArgs()));
		// 실제 타겟을 실행함. 이 부분이 없으면 advice가 적용된 메소드가 동작 하지 않음
		Object result = pjp.proceed(); // proceed는 Exception보다 상위 Throwable을 처리함

		long endTime = System.currentTimeMillis();
		// target메소드의 동작 시간을 출력
		logger.info(pjp.getSignature().getName() + " : " + (endTime - startTime)); 
		logger.info("==============================");

		// Around를 사용할 경우 반드시 Object를 리턴해야함.
		return result;
	}

}
