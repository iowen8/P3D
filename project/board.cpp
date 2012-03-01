#include <p3d/Calibration/chessboard.h>
#include <string>

int main(int argc, char** argv)
{
	chessboard board(std::string(argv[1]),atoi(argv[2]), atoi(argv[3]), atoi(argv[4]), false);
	board.createBoard();
}
