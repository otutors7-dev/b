package com.sunbeam;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.FIELD,ElementType.METHOD,ElementType.CONSTRUCTOR,ElementType.LOCAL_VARIABLE,ElementType.TYPE})
public @interface DevInfo {
	String value( ); //default attribute  
	String company() default "Sunbeam Infotech"; 
	String designation( ) default "SW DEV"; 
}
