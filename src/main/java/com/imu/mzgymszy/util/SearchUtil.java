package com.imu.mzgymszy.util;

import java.io.IOException;
import java.nio.file.FileSystems;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.CorruptIndexException;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.index.Term;
import org.apache.lucene.queryparser.classic.MultiFieldQueryParser;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.search.BooleanClause;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;

import com.imu.mzgymszy.util.seg.ComplexAnalyzer;

/** 
 * @ClassName: SearchUtil 
 * @Description:该类封装对索引库的各类常见操作
 * @author tianhao 
 * @date 2015年12月7日 下午1:10:21 
 *  
 */
public class SearchUtil {
	final static Analyzer analyzer = new ComplexAnalyzer();//自定义的复杂中文分词器
	final static Path path = FileSystems.getDefault().getPath("index", "dataindex");//索引文件位置
    
    /**
     * @Author tianhao
     * @Time 2015年12月7日 下午1:01:32
     * @Title: addIndex 
     * @Description:添加文档到索引库
     * @param @param doc 封装的文档类，可以用Field类添加字段和值，doc类似数据库中的一条记录的概念
     * 用法如下：doc.add(new Field("name", value, TextField.TYPE_STORED));
     * @return boolean 添加是否成功 
     */
    public static boolean addIndex(Document doc) {
    	boolean result = false;
    	Directory dir = null;
    	IndexWriter iw = null;
		try {
			dir = FSDirectory.open(path);
			IndexWriterConfig conf = new IndexWriterConfig(analyzer);
			iw = new IndexWriter(dir,conf);
			iw.addDocument(doc);
			result = true;
		} catch (IOException e) {
			e.printStackTrace();
		} finally{
			try {
				iw.close();
				dir.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return result;
    }
    
    /**
     * @Author tianhao
     * @Time 2017年5月30日 下午2:08:37
     * @Title: rebuild 
     * @Description:批量重建索引
     * @param @param list
     * @param @return
     * @return boolean 
     */
    public static boolean rebuild(List<Document> list) {
    	boolean result = false;
    	Directory dir = null;
    	IndexWriter iw = null;
		try {
			dir = FSDirectory.open(path);
			IndexWriterConfig conf = new IndexWriterConfig(analyzer);
			conf.setOpenMode(IndexWriterConfig.OpenMode.CREATE);
			iw = new IndexWriter(dir,conf);
			for(Document doc:list){
				iw.addDocument(doc);
			}
			result = true;
			iw.commit();
		} catch (Exception e) {
			result = false;
			try {
				iw.rollback();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally{
			try {
				iw.close();
				dir.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return result;
    }
    
    /**
     * @Author tianhao
     * @Time 2015年12月7日 下午1:24:40
     * @Title: delIndex 
     * @Description:根据一个查询条件在索引库中删除对应的索引
     * 请注意匹配的准确性，一个不准确的匹配可能导致大量索引被误删
     * @param @param key 字段名
     * @param @param value 字段值
     * @param @return
     * @return boolean 
     */
    public static boolean delIndex(String key,String value) {
    	boolean result = false;
    	Term term = new Term(key,value);
    	Directory dir = null;
    	IndexWriter iw = null;
		try {
			dir = FSDirectory.open(path);
			IndexWriterConfig conf = new IndexWriterConfig(analyzer);
			iw = new IndexWriter(dir,conf);
			iw.deleteDocuments(term);
			result = true;
		} catch (IOException e) {
			e.printStackTrace();
		} finally{
			try {
				iw.close();
				dir.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return result;
    }
    
    /**
     * @Author tianhao
     * @Time 2015年12月7日 下午1:27:06
     * @Title: updateIndex 
     * @Description:根据查询条件更新索引库
     * 请注意匹配的准确性，一个不准确的匹配可能导致大量索引被误更新
     * @param @param key 字段名
     * @param @param value 字段值
     * @param @param doc 更新的文档
     * @param @return
     * @return boolean 更新是否成功
     */
    public static boolean updateIndex(String key,String value,Document doc) {
    	boolean result = false;
    	Term term = new Term(key,value);
    	Directory dir = null;
    	IndexWriter iw = null;
		try {
			dir = FSDirectory.open(path);
			IndexWriterConfig conf = new IndexWriterConfig(analyzer);
			iw = new IndexWriter(dir,conf);
			iw.updateDocument(term, doc);
			result = true;
		} catch (IOException e) {
			e.printStackTrace();
		} finally{
			try {
				iw.close();
				dir.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return result;
    }
    
    /**
     * @Author tianhao
     * @Time 2015年12月7日 下午1:22:05
     * @Title: search 
     * @Description:根据查询条件查询
     * @param @param key 字段名
     * @param @param value 字段值
     * @param @param count 按查询相关度排名的top count条记录
     * @param @return
     * @return List<Document> 
     */
    public static List<Document> search(String[] key,String value,int count) {  
    	List<Document> list = new ArrayList<Document>();
    	Directory dir = null;
    	IndexReader reader = null;
        try {
        	dir = FSDirectory.open(path);
        	reader = DirectoryReader.open(dir);
            IndexSearcher searcher = new IndexSearcher(reader);
            BooleanClause.Occur[] flags = new BooleanClause.Occur[key.length];
            for(int i=0;i<key.length;i++){
            	flags[i] = BooleanClause.Occur.SHOULD;
            }
            Query query = MultiFieldQueryParser.parse(value,key,flags,analyzer);
            ScoreDoc[] hits = searcher.search(query,count).scoreDocs;
            for (int i = 0; i < hits.length; i++) {
              Document hitDoc = searcher.doc(hits[i].doc);
              list.add(hitDoc);
            }
        } catch (CorruptIndexException e) {  
            e.printStackTrace();  
        } catch (IOException e) {  
            e.printStackTrace();  
        } catch (ParseException e) {  
            e.printStackTrace();  
        }finally{
        	try {
				reader.close();
				dir.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
        }
        return list;
    }
    
    public void testInit() {  
        String txt = "京华时报1月23日报道 昨天，受一股来自中西伯利亚的强冷空气影响，本市出现大风降温天气，白天最高气温只有零下7摄氏度，同时伴有6到7级的偏北风。";  
		Document doc = new Document();
		doc.add(new Field("text", txt, TextField.TYPE_STORED));
		List<Document> list = new ArrayList<Document>();
		list.add(doc);
		rebuild(list);
    }
    
    public static void main(String[] args) {
    	SearchUtil su = new SearchUtil();
    	su.testInit();
    	String[] key = {"text"};
    	String value = "冷空气";
    	List<Document> list = SearchUtil.search(key,value,10);
    	System.out.println("检索到"+list.size()+"条记录：");
    	for(Document doc:list){
    		System.out.println(doc.get("text"));
    	}
	}
}
