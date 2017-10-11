package com.imu.mzgymszy.util.seg;

import java.io.File;
import org.apache.lucene.analysis.Analyzer;
import com.chenlb.mmseg4j.Dictionary;
import com.chenlb.mmseg4j.MaxWordSeg;
import com.chenlb.mmseg4j.Seg;

public class MMSegAnalyzer extends Analyzer {

	protected Dictionary dic;

	public MMSegAnalyzer() {
		dic = Dictionary.getInstance();
	}

	public MMSegAnalyzer(String path) {
		dic = Dictionary.getInstance(path);
	}

	public MMSegAnalyzer(File path) {
		dic = Dictionary.getInstance(path);
	}

	public MMSegAnalyzer(Dictionary dic) {
		super();
		this.dic = dic;
	}

	protected Seg newSeg() {
		return new MaxWordSeg(dic);
	}

	public Dictionary getDict() {
		return dic;
	}

	@Override
	protected TokenStreamComponents createComponents(String fieldName) {
		return new TokenStreamComponents(new MMSegTokenizer(newSeg()));
	}
}
