package com.summer.blog.service.impl;

import com.summer.blog.dao.LabelDao;
import com.summer.blog.entities.Label;
import com.summer.blog.entities.Recommend;
import com.summer.blog.service.LabelService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Author: summer
 * @Mail: lijiahaosummer@gmail.com
 * @Date: 2018 18-5-2 下午7:39 Project: myblog Package: com.summer.blog.service.impl Desc:
 */
@Service
public class LabelServiceImpl implements LabelService {
  private final LabelDao labelDao;

  @Autowired
  public LabelServiceImpl(LabelDao labelDao) {
    this.labelDao = labelDao;
  }

  @Override
  public List<Label> getAllLabel() {
    return labelDao.getAllLabel();
  }

  @Override
  public List<Recommend> getAllRecommends() {
    return labelDao.getAllRecommends();
  }
}
