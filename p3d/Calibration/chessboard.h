#include <opencv/cv.h>
#include <opencv/highgui.h>
#include <string.h>
#include <vector.h>

struct Square 
{
	bool color;
	cv::Point2f topLeft;
	cv::Point2f bottomLeft;
	cv::Point2f topRight;
	cv::Point2f bottomRight;
};

struct Board
{
	std::vector< std::vector<Square> > board;
	int lengthOfSide;
	int squaresPerRow;
	int numberOfRows;
	bool topLeftSquareColor;
};

class chessboard 
{
public:
	chessboard(std::string _fileName,int _lengthOfSide, int _squaresPerRow, int _numberOfRows, bool _topLeftSquareColor = true);
	~chessboard();
	
	void drawSquare(Square square);
	void createBoard(bool save=true);
	void saveBoard();
	
private:
	Board cBoard;
	IplImage* image;
	std::string fileName;
};