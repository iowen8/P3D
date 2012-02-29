#include <p3d/Calibration/chessboard.h>

int main()
{
	chessboard board("test.png",200, 8, 5, false);
	board.createBoard();
}
