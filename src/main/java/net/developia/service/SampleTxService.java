package net.developia.service;

import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface SampleTxService {
	public void addData(String value);

}
