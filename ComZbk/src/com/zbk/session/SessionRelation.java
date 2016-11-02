package com.zbk.session;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.zbk.base.Interface.NameCN;

@Entity
@Table(name="session_relation")
public class SessionRelation {
/*relation_id      主键 关系唯一ID

    relation_dec     描述

    session_id       外键  小节ID   

 	select_bank        外键  选择题库

 	file_bank  		 外键  填空题ID

 	create_time      录入时间*/
   @NameCN("关系主键")
   @Id
   @Column(name="relation_id")
   @GeneratedValue(strategy=GenerationType.AUTO)
	private Integer relationId;
   
   @Column(name="relation_dec")
   private String relationDec;
   
   
   
  
}
