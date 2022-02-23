package com.farmporter.service;

import java.util.List;

import com.farmporter.model.NoticeVO;

public interface INoticeService {
	
	List<NoticeVO> getNoticeList();

	NoticeVO getNoticeInfo(int noticeNo);
	
	void insertNotice(NoticeVO notice);
	
	void deleteNotice(int noticeNo);

}
