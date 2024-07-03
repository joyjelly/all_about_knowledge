package kr.co.sist.aak.module.instructor.qna.dao;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import kr.co.sist.aak.domain.admin.vo.QnaManagementVO;
import kr.co.sist.aak.domain.instructor.LectureDomain;
import kr.co.sist.aak.domain.instructor.QnaDomain;
import kr.co.sist.aak.domain.instructor.vo.QnaVO;
import kr.co.sist.aak.util.MybatisDAO;

@Component
public class QnaDAO {
	//문의리스트 조회
	public List<QnaDomain> selectQna() throws PersistenceException{
		List<QnaDomain> list= null;
		
		MybatisDAO mbDAO= MybatisDAO.getInstance();
		SqlSession ss= mbDAO.getMyBatisHandler(false);
		
		list=ss.selectList("kr.co.sist.aak.instructor.qnaList");
		
		mbDAO.closeHanlder(ss);
		return list;
	}
	
	//문의리스트 상세
	public QnaDomain detailQna(String qna_no) throws PersistenceException{
		QnaDomain qnd= null;
		
		MybatisDAO mbDAO= MybatisDAO.getInstance();
		SqlSession ss= mbDAO.getMyBatisHandler(false);
		
		qnd=ss.selectOne("kr.co.sist.aak.instructor.qnaDetail",qna_no);
		//System.out.println("DAO=-------------------" + qna_no);
		//System.out.println("DAO=-------------------" + qnd);
		
		mbDAO.closeHanlder(ss);
		
		return qnd;
		
		
	}
	
	
	//문의답변
	public int updateAnswer(String qna_no){
		int cnt = 0;
		
		MybatisDAO mbDao=MybatisDAO.getInstance();
		SqlSession ss= mbDao.getMyBatisHandler(false);
		
		cnt=ss.update("kr.co.sist.aak.instructor.answerQna",qna_no);
		
		mbDao.closeHanlder(ss);
		
		return cnt;
		
		
	}
	
	//답변여부로 글 분류
//		public List<QnaDomain> selectqnaStatus(int status) throws PersistenceException {
//			List<QnaDomain> list = null;
//
//			MybatisDAO mbDAO = MybatisDAO.getInstance();
//			SqlSession ss = mbDAO.getMyBatisHandler(false);
//
//			list = ss.select("kr.co.sist.aak.admin.dynamicNotificaionStatus", status);
//			mbDAO.closeHanlder(ss);
//			return list;
//		}
//		
//		//제목검색
//		public List<LectureDomain> selectLectureTitle(String sub_title) throws PersistenceException {
//			List<LectureDomain> list = null;
//			
//			MybatisDAO mbDAO = MybatisDAO.getInstance();
//			SqlSession ss = mbDAO.getMyBatisHandler(false);
//			
//			list = ss.selectList("kr.co.sist.aak.searchTitle", sub_title);
//			
//			mbDAO.closeHanlder(ss);
//			return list;
//		}
}

