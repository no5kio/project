package com.farmporter.dao;

import java.util.List;
import java.util.Map;

import com.farmporter.model.NoticeVO;
import com.farmporter.model.UserVO;
import com.farmporter.model.WpriceVO;


public interface INoticeRepository {

	List<NoticeVO>getNoticeList();

	NoticeVO getNoticeInfo(int noticeNo);
	
	void insertNotice(NoticeVO notice);
	
	void deleteNotice(int deleteNo);

}
