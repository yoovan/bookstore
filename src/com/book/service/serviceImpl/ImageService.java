package com.book.service.serviceImpl;

import com.book.dao.daoImpl.ImageDao;
import com.book.service.IImageService;

import java.sql.SQLException;

public class ImageService implements IImageService {
    private ImageDao imageDao;
    public ImageService() throws ClassNotFoundException {
        imageDao = new ImageDao();
    }
    @Override
    public boolean saveImage(int id, int type, String src) throws SQLException {
        return imageDao.saveImage(id, type, src);
    }
}
