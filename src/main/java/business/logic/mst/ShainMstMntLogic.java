/**
 * ファイル名：ShainMstMntLogic.java
 *
 * 変更履歴
 * 1.0  2010/08/24 Kazuya.Naraki
 */
package business.logic.mst;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import business.db.dao.mst.ShainMstMntDao;
import business.dto.LoginUserDto;
import business.dto.mst.ShainMstMntDto;
import business.logic.utils.CheckUtils;
import business.logic.utils.CommonUtils;
import constant.DbConstant.M_shain;

/**
 * 説明：社員マスタメンテナンス処理のロジック
 * @author naraki
 *
 */
public class ShainMstMntLogic {

    /**
     * 社員マスタの更新系の処理を行う
     * @param shainMstMntDtoList 更新対象社員マスタDtoリスト
     *
     * @param loginUserDto ログインユーザーDto
     * @author naraki
     */
	public void updateMshain(List<ShainMstMntDto> shainMstMntDtoList, LoginUserDto loginUserDto) throws Exception{
	    if (shainMstMntDtoList == null || shainMstMntDtoList.isEmpty()) {
	        // 更新対象がない場合は何もせずに終了する
	        return;
	    }

	    ShainMstMntDao shainMstMntDao = new ShainMstMntDao();
	    Connection connection = shainMstMntDao.getConnection();
	    connection.setAutoCommit(false);

	    try {
	        for (ShainMstMntDto shainMstMntDto : shainMstMntDtoList) {
	            boolean deleteFlg = shainMstMntDto.getDeleteFlg();

	            if (deleteFlg) {
	                shainMstMntDao.deleteShainMst(shainMstMntDto.getShainId());
	            } else {
	                shainMstMntDao.updateShainMst(shainMstMntDto, loginUserDto);
	            }
	        }
	        connection.commit();
	    } catch (Exception e) {
	        connection.rollback();
	        throw e;
	    } finally {
	        if (connection != null) {
	            connection.close();
	        }
	    }
	}

    /**
     * 社員マスタの登録処理を行う
     * @param mshainDtoList 更新対象社員マスタDtoリスト
     *
     * @param loginUserDto ログインユーザーDto
     * @author naraki
     */
    public void registMshain(ShainMstMntDto shainMstMntDto, LoginUserDto loginUserDto) throws Exception{

        // 社員マスタDao
        ShainMstMntDao shainMstMntDao = new ShainMstMntDao();

        // 社員ＩＤを採番する。
        CommonUtils commonUtils = new CommonUtils();
        String nextShainID = commonUtils.getNextId(M_shain.TABLE_NAME.getName());

        shainMstMntDto.setShainId(nextShainID);

        // 登録
        shainMstMntDao.registShainMst(shainMstMntDto, loginUserDto);

    }

    /**
     * 社員マスタ情報を取得する。
     * @return 社員マスタリスト
     * @author naraki
     */
    public List<ShainMstMntDto> getShainData(LoginUserDto loginUserDto) throws SQLException{

        // 社員マスタDao
        ShainMstMntDao shainMstMntDao = new ShainMstMntDao();

        // 社員情報を取得する。
        List<ShainMstMntDto> mShainList = shainMstMntDao.getShainAllList();

        // 自分をリストから省く
        // 削除対象
        ShainMstMntDto removeMshainDto = null;

        for (ShainMstMntDto mshainDto : mShainList) {
            String shainId = mshainDto.getShainId();

            if (loginUserDto.getShainId().equals(shainId)) {
                removeMshainDto = mshainDto;
                break;
            }
        }

        if (!CheckUtils.isEmpty(removeMshainDto)) {
            // 削除対象が空でない場合
            mShainList.remove(removeMshainDto);
        }

        return mShainList;
    }
}
