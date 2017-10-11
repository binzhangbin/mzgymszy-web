package com.imu.mzgymszy.util.seg;

import java.io.File;

import com.chenlb.mmseg4j.ComplexSeg;
import com.chenlb.mmseg4j.Dictionary;
import com.chenlb.mmseg4j.Seg;

/** 
 * @ClassName: ComplexAnalyzer 
 * @Description:复杂分词的适配器模式
 * @author tianhao 
 * @date 2015年12月6日 下午10:25:43 
 *  
 */
public class ComplexAnalyzer extends MMSegAnalyzer {

	public ComplexAnalyzer() {
		super();
	}

	public ComplexAnalyzer(String path) {
		super(path);
	}
	
	public ComplexAnalyzer(Dictionary dic) {
		super(dic);
	}

	public ComplexAnalyzer(File path) {
		super(path);
	}

	protected Seg newSeg() {
		return new ComplexSeg(dic);
	}
}
