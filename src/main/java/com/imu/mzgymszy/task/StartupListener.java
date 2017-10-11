package com.imu.mzgymszy.task;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.apache.lucene.document.Document;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Service;

import com.imu.mzgymszy.originaldata.model.OriginaldataEntity;
import com.imu.mzgymszy.originaldata.service.OriginaldataService;
import com.imu.mzgymszy.util.SearchUtil;

/** 
* @ClassName: StartupListener 
* @Description: 在项目启动时重建一遍索引
* @author tianhao 
* @date 2017年5月31日 上午10:49:21 
*  
*/
@Service
public class StartupListener implements ApplicationListener<ContextRefreshedEvent> {

	@Autowired
	private OriginaldataService originaldataService;
	private Logger logger = Logger.getLogger(this.getClass());
	
    @Override
    public void onApplicationEvent(ContextRefreshedEvent evt) {

        // 防止启动两次
        if (evt.getApplicationContext().getParent() != null) {
            buildIndex();
        }

    }

    private void buildIndex() {
    	logger.info("重建索引");
		List<OriginaldataEntity> list = originaldataService.queryListByPage(null);
		List<Document> docList = new ArrayList<Document>();
		for(OriginaldataEntity ode:list){
			docList.add(ode.toIndex());
		}
		SearchUtil.rebuild(docList);
    }

}
