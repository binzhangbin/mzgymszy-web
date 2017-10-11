package com.imu.mzgymszy.task;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.apache.lucene.document.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.imu.mzgymszy.originaldata.model.OriginaldataEntity;
import com.imu.mzgymszy.originaldata.service.OriginaldataService;
import com.imu.mzgymszy.util.SearchUtil;

/**
 * spring task 定时任务，适用于单系统
 * 注意：不适合用于集群
 */
@Component
@Lazy(false)  
public class IndexTask {
	@Autowired
	private OriginaldataService originaldataService;
	private Logger logger = Logger.getLogger(this.getClass());
	
	@Scheduled(cron = "0 0 2 * * ?")
	public void rebuild() {
		logger.info("重建索引");
		List<OriginaldataEntity> list = originaldataService.queryListByPage(null);
		List<Document> docList = new ArrayList<Document>();
		for(OriginaldataEntity ode:list){
			docList.add(ode.toIndex());
		}
		SearchUtil.rebuild(docList);
	}
}
