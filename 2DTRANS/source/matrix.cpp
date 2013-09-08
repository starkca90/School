#include "matrix.h"
#include <cmath>
#include <iomanip>

// No-Arg Constructor - create Matrix and clear cells
// Make a 1x1 "default" Matrix
Matrix::Matrix()
{
	rows = 1;
	cols = 1;
	the_Matrix = new double*[rows];
	for(unsigned int i = 0; i < rows; i++)
	{
		the_Matrix[i] = new double[cols];
	}
	clear();
}

// Constructor - create Matrix and clear cells.  If rows or cols
// is < 1, throw an exception
Matrix::Matrix(unsigned int rows, unsigned int cols) throw (MatrixException)
												{
	if(rows < 1 || cols < 1)
	{
		throw MatrixException("Constructor: Invalid row & column combination");
	}
	this->rows = rows;
	this->cols = cols;

	the_Matrix = new double*[rows];
	for(unsigned int i = 0; i < rows; i++)
	{
		the_Matrix[i] = new double[cols];
	}
	clear();
												}

// Copy constructor - make a new Matrix just like rhs
Matrix::Matrix(const Matrix& from)
{
	// Make a matrix of from size
	Matrix(from.rows, from.cols);

	// Now that space is available, copy all values from "from" to matrix
	for(unsigned int r = 0; r < rows; r++)
	{
		for(unsigned int c = 0; c < cols; c++)
		{
			the_Matrix[r][c] = from.the_Matrix[r][c];
		}
	}
}

// Destructor - virtual just in case.  Free allocated memory
Matrix::~Matrix()
{
	// Delete the double arrays that are associated with each row
	for(unsigned int r = 0; r < rows; r++)
	{
		delete[]this->the_Matrix[r];
	}
	// Delete the double array that held each row, but can be considered the columns
	delete[]this->the_Matrix;
}

// Assignment operator - make this just like rhs
Matrix& Matrix::operator=(const Matrix& rhs)
{
	if(this == &rhs)
	{
		return *this;
	}

	// Delete the old matrix
	for(unsigned int r = 0; r < rows; r++)
	{
		delete[] this->the_Matrix[r];
	}
	delete[]this->the_Matrix;

	this->rows = rhs.rows;
	this->cols = rhs.cols;
	this->the_Matrix = new double * [rows];
	for(unsigned int r = 0; r < rhs.rows; r++)
	{
		the_Matrix[r] = new double[cols];

	}

	// Copy all the values from rhs to new Matrix
	for(unsigned int r = 0; r < rows; r++)
	{
		for(unsigned int c = 0; c < cols; c++)
		{
			the_Matrix[r][c] = rhs.the_Matrix[r][c];
		}
	}
	return *this;
}

// Matrix addition - lhs and rhs must be same size otherwise
// an exception shall be thrown
Matrix Matrix::operator+(const Matrix& rhs) const throw (MatrixException)
												{
	if(rhs.rows != rows || rhs.cols != cols)
	{
		throw MatrixException("Addition: sizes mismatch");
	}

	Matrix sum(rows, cols);

	// Loop through the new matrix and have each element equal the sum of each rhs
	// element + this each element
	for(unsigned int r = 0; r < rows; r++)
	{
		for(unsigned int c = 0; c < cols; c++)
		{
			sum.the_Matrix[r][c] = this->the_Matrix[r][c] + rhs.the_Matrix[r][c];
		}
	}
	return sum;
												}

// Matrix subtraction - lhs and rhs must be same size otherwise
// an exception shall be thrown
Matrix Matrix::operator-(const Matrix& rhs) const throw (MatrixException)
												{
	if(rhs.rows != rows || rhs.cols != cols)
	{
		throw MatrixException("Subtraction: size mismatch");
	}

	Matrix diff(rows, cols);

	for(unsigned int r = 0; r < rows; r++)
	{
		for(unsigned int c = 0; c < cols; c++)
		{
			diff.the_Matrix[r][c] = this->the_Matrix[r][c] - rhs.the_Matrix[r][c];
		}
	}

	return diff;
												}

// Matrix multiplication - lhs and rhs must be compatible otherwise
// an exception shall be thrown
Matrix Matrix::operator*(const Matrix& rhs) const throw (MatrixException)
{
	if(rhs.rows != this->cols)
	{
		throw MatrixException("Multiplication: size mismatch");
	}

	Matrix prod(rows, rhs.cols);

	/*
	 * Using algorithm/code from
	 * http://bytes.com/topic/c/answers/543487-matrix-multiplication-code
	 *
	 * Iterates through the product Matrix, and uses the cols of "this" Matrix
	 * Multiplies the element at prod.row, this.col for "this" Matrix times this.col, prod.col
	 * of rhs Matrix, then adds resulting product to the current element of product Matrix.
	 */
	for(unsigned int i = 0; i < prod.rows; i++)
	{
		for(unsigned int j = 0; j < prod.cols; j++)
		{
			for(unsigned int k = 0; k < cols; k++)
			{
				prod.the_Matrix[i][j] += the_Matrix[i][k] * rhs.the_Matrix[k][j];
			}
		}
	}

	return prod;
}

Matrix Matrix::operator*(const double rhs) const
{
	Matrix prod(rows, cols);
	for(unsigned int r = 0; r < prod.rows; r++)
	{
		for(unsigned int c = 0; c <prod.cols; c++)
		{
			prod.the_Matrix[r][c] = the_Matrix[r][c] * rhs;
		}
	}
	return prod;
}

// Inverse of a square Matrix - must be square otherwise an
// exception shall be thrown
Matrix Matrix::operator!() const throw (MatrixException)
{
	if(rows != cols)
	{
		throw MatrixException("Inverse: size mismatch");
	}

	// This matrix is not required, but does make the code a bit more readable
	Matrix temp(rows,cols);
	// the cofactor matrix
	Matrix cf(rows,cols);

	temp = *this;

	Matrix inv(rows,cols);

	double detInv = 1/temp.det();

	if(temp.det() == 0)
	{
		throw MatrixException("Inverse: zero determinant");
	}

	for(unsigned int r = 0; r < cf.rows; r++)
	{
		for(unsigned int c = 0; c < cf.cols; c++)
		{
			cf.the_Matrix[r][c] = temp.eliminate(r,c).det()*pow(-1,(r+c));
		}
	}

	cf = ~cf;
	inv = cf * detInv;

	return inv;
}

// Matrix transposition - should always work
Matrix Matrix::operator~() const
												{
	Matrix trans(cols,rows);

	for(unsigned int r = 0; r < trans.rows; r++)
	{
		for(unsigned int c = 0; c < trans.cols; c++)
		{
			trans.the_Matrix[r][c] = the_Matrix[c][r];
		}
	}

	return trans;
												}

// Determinant of a square Matrix - must be square otherwise an
// exception shall be thrown
double Matrix::det() const throw (MatrixException)
		{
	if(rows != cols)
	{
		throw MatrixException("Determinant: size mismatch");
	}

	double det, tempDet, tempEntry = 0;

	if(rows==1)
	{
		det=the_Matrix[1][1];
	}
	else if(rows==2)
	{
		det=the_Matrix[1][1]*the_Matrix[0][0] - the_Matrix[1][0]*the_Matrix[0][1];
	}
	else
	{
		Matrix a(rows,cols);
		a = *this;

		for(unsigned int c=0; c<cols; c++)
		{
			tempDet = a.eliminate(0,c).det();
			tempEntry = the_Matrix[0][c];
			det += pow(-1,1+(c+1)) * tempEntry * tempDet;
		}
	}

	return det;
		}

// Clear Matrix to all members 0.0
void Matrix::clear()
{
	// Loop through the matrix and set each entry to zero
	for(unsigned int r = 0; r < this->rows; r++)
	{
		for(unsigned int c = 0; c < this->cols; c++)
		{
			this->the_Matrix[r][c] = 0.0;
		}
	}
}

// Returns a Matrix similar to this, but with row and
// column removed.  Thus, returned.rows = this.row-1, etc.  Must
// have more than one row and column or an exception will be
// thrown
Matrix Matrix::eliminate(unsigned int row, unsigned int col) const throw (MatrixException)
{
	if((this -> rows <= 1) || (this -> cols <= 1))
	{
		throw MatrixException("Eliminate: size mismatch\n");
	}

	Matrix elim(this -> rows-1, this -> cols-1);

	//set of counters to iterate through the matrix being eliminated
	unsigned int j = 0;
	unsigned int k = 0;
	for(unsigned int i = 0; i < elim.rows; i++){

		//if j==row, the whole row can be ignored
		//in this case, i is decremented so that the
		//returned matrix will have the proper row value
		//the next loop around
		if(j != row){
			for(unsigned int x = 0; x < elim.cols; x++){
				//if this is not an elimination column,
				//copy the contents as normal
				if(k != col){
					elim[i][x] = this -> the_Matrix[j][k];
					k++;
				}
				//otherwise copy the next column over as this is
				//an elimination column
				else{
					k++;
					elim[i][x] = this -> the_Matrix[j][k];
					k++;
				}
			}
		}
		//this row was skipped, decrement row so that the for
		//loop incrementation sets it normally
		else{
			i--;
		}
		//reset to first column and advance a row
		k = 0;
		j++;
	}
	return elim;
}

// Access Operators - throw an exception if index out of range
double* Matrix::operator[](unsigned int row) throw (MatrixException)
{
	if(row > rows || row < 0)
	{
		throw MatrixException("Access: index out of bounds");
	}

	return the_Matrix[row];
}

double* Matrix::operator[](unsigned int row) const throw (MatrixException)
{
	if(row > rows || row < 0)
	{
		throw MatrixException("Access: index out of bounds");
	}

	return the_Matrix[row];
}

// I/O - for convenience
std::ostream& Matrix::out(std::ostream& os) const
{
	os << std::endl;
	for(unsigned int r = 0; r < rows; r++)
	{
		for(unsigned int c = 0; c < cols; c++)
		{
			// Manipulate the stream so the output is nice looking
			// Sets the width to 10 places, allows for ample padding
			// Sets the fill to be blank
			// Sets the precision to 4 decimal places
			os << std::setw(10) << std::setfill(' ') << std::setprecision(4);
			os << the_Matrix[r][c];
		}
		os << std::endl;
	}
	return os;
}

// Overloaded global << with std::ostream as lhs, Matrix as rhs.
std::ostream& operator<<(std::ostream& os, const Matrix& rhs)
{
	return rhs.out(os);
}
