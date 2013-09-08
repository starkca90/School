/**
 * matrix.h - declaration of matrix class.  This class will be
 * capable of represting a Matrix as a first-class type.
 * 
 * Do not change this file unless otherwise instructed.
 */
 


#ifndef MATRIX_H
#define MATRIX_H

#include <iostream> // for std::ostream
#include <stdexcept>	// for std::runtime_error
#include <string>	// used in exception

// a helper class to bundle a message with any thrown exceptions
class MatrixException:public std::runtime_error
{
	public:
		MatrixException(std::string message):
		      std::runtime_error((std::string("Matrix Exception: ") + 
		               message).c_str()) {}
};


class Matrix
{
	public:
		// No-Arg Constructor - create Matrix and clear cells
		// Make a 1x1 "default" Matrix
		Matrix();

		// Constructor - create Matrix and clear cells.  If rows or cols
		// is < 1, throw an exception
		Matrix(unsigned int rows, unsigned int cols) throw (MatrixException);
		
		// Copy constructor - make a new Matrix just like rhs
		Matrix(const Matrix& from);
		
		// Destructor - virtual just in case.  Free allocated memory
		virtual ~Matrix();
		
		// Assignment operator - make this just like rhs
		Matrix& operator=(const Matrix& rhs);
		
		// Matrix addition - lhs and rhs must be same size otherwise
		// an exception shall be thrown
		Matrix operator+(const Matrix& rhs) const throw (MatrixException);
		
		// Matrix subtraction - lhs and rhs must be same size otherwise
		// an exception shall be thrown
		Matrix operator-(const Matrix& rhs) const throw (MatrixException);
		
		// Matrix multiplication - lhs and rhs must be compatible otherwise
		// an exception shall be thrown
		Matrix operator*(const Matrix& rhs) const throw (MatrixException);

		// Inverse of a square Matrix - must be square otherwise an
		// exception shall be thrown
		Matrix operator!() const throw (MatrixException);

		// Matrix transposition - should always work
		Matrix operator~() const;

		// Determinant of a square Matrix - must be square otherwise an
		// exception shall be thrown
		double det() const throw (MatrixException);	

		// Clear Matrix to all members 0.0
		void clear();
		
		// Returns a Matrix similar to this, but with row and
		// column removed.  Thus, returned.rows = this.row-1, etc.  Must
		// have more than one row and column or an exception will be 
		// thrown
		Matrix eliminate(unsigned int row, unsigned int col) const throw (MatrixException);

		// Access Operators - throw an exception if index out of range
		double* operator[](unsigned int row) throw (MatrixException);

		double* operator[](unsigned int row) const throw (MatrixException);
		
		// I/O - for convenience
		std::ostream& out(std::ostream& os) const;
		
	private:
		// The data
		double** the_Matrix;
		unsigned int rows;
		unsigned int cols;
		// Matrix scaling used in inverse method
		Matrix operator*(const double rhs) const;
};

// Overloaded global << with std::ostream as lhs, Matrix as rhs.
std::ostream& operator<<(std::ostream& os, const Matrix& rhs);

// We would normally have a corresponding >> operator, but
// will defer that until later.

#endif

