package com.zbk.base.Interface;

import java.io.Serializable;


import org.codehaus.jackson.annotate.JsonIgnore;

/**
 * To be a pojo, must have a key member.
 * 
 * @author Seraph_fd
 * 
 */
public interface Pojo extends Serializable {
	@JsonIgnore
	public Serializable getKey();
}