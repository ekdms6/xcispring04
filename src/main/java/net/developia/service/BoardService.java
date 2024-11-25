package net.developia.service;

import java.util.List;

import net.developia.domain.BoardVO;
import net.developia.domain.Criteria;

public interface BoardService {
	public void register(BoardVO board) throws Exception;
	public BoardVO get(Long bno) throws Exception;
	public boolean modify(BoardVO board) throws Exception;
	public boolean remove(Long bno) throws Exception;
	public List<BoardVO> getList(Criteria cri) throws Exception;
	public int getTotal(Criteria cri);

}
