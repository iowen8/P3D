#include "chessboard.h"

chessboard::chessboard(std::string _fileName, int _lengthOfSide, int _squaresPerRow, int _numberOfRows, bool _topLeftSquareColor)
{
	fileName = _fileName;
	cBoard.lengthOfSide = _lengthOfSide;
	cBoard.squaresPerRow = _squaresPerRow;
	cBoard.numberOfRows = _numberOfRows;
	cBoard.topLeftSquareColor = _topLeftSquareColor;	
	cBoard.board.resize(cBoard.numberOfRows);
	
	for (int i = 0; i<cBoard.numberOfRows; i++)
		cBoard.board[i].resize(cBoard.squaresPerRow);
}

chessboard::~chessboard()
{
	
}

void chessboard::drawSquare(Square square)
{
	CvScalar black;
	CvScalar white;
	black.val[0]=0;
	white.val[0]=255;
	
	for (int row = square.topLeft.y; row < square.bottomRight.y; row++)
	{
		for (int col = square.topLeft.x; col < square.topRight.x; col++)
		{	
			(square.color) ?  cvSet2D(image,row,col,white) : cvSet2D(image,row,col,black);
		}
	}
}

void chessboard::createBoard(bool save)
{
	int width, height;
	
	width = cBoard.squaresPerRow * cBoard.lengthOfSide;
	height = cBoard.numberOfRows * cBoard.lengthOfSide;
	
	image = cvCreateImage(cvSize(width,height),IPL_DEPTH_8U,1);
	
	bool scolor = cBoard.topLeftSquareColor;
	bool color;
	
	for (int row =0; row<cBoard.numberOfRows; row++)
	{
		color = scolor;
		for (int square = 0; square<cBoard.squaresPerRow; square++)
		{
			cBoard.board[row][square].topLeft.x = square * cBoard.lengthOfSide;
			cBoard.board[row][square].topLeft.y = row * cBoard.lengthOfSide;
			
			cBoard.board[row][square].topRight.x = (square * cBoard.lengthOfSide) + (cBoard.lengthOfSide - 1);
			cBoard.board[row][square].topRight.y = row * cBoard.lengthOfSide;
			
			cBoard.board[row][square].bottomLeft.x = square * cBoard.lengthOfSide;
			cBoard.board[row][square].bottomLeft.y = (row * cBoard.lengthOfSide) + (cBoard.lengthOfSide - 1);
			
			cBoard.board[row][square].bottomRight.x = (square * cBoard.lengthOfSide) + (cBoard.lengthOfSide - 1);
			cBoard.board[row][square].bottomRight.y = (row * cBoard.lengthOfSide) + (cBoard.lengthOfSide - 1);
			
			cBoard.board[row][square].color = color;
			color = !color;
			
			drawSquare(cBoard.board[row][square]);
		}
		scolor = !scolor;
	}
	
	if (save)
		saveBoard();
}

void chessboard::saveBoard()
{
	cvSaveImage(fileName.c_str(), image);	
}