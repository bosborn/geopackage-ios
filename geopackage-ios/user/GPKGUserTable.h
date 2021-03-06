//
//  GPKGUserTable.h
//  geopackage-ios
//
//  Created by Brian Osborn on 5/20/15.
//  Copyright (c) 2015 NGA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GPKGUserColumn.h"
#import "GPKGContents.h"

/**
 *  Abstract user table
 */
@interface GPKGUserTable : NSObject <NSMutableCopying>

/**
 *  Table name
 */
@property (nonatomic, strong) NSString *tableName;

/**
 * Foreign key to Contents
 */
@property (nonatomic, strong) GPKGContents *contents;

/**
 *  Initialize
 *
 *  @param tableName table name
 *  @param columns   columns
 *
 *  @return new user table
 */
-(instancetype) initWithTable: (NSString *) tableName andColumns: (NSArray *) columns;

/**
 * Initialize
 *
 * @param userTable
 *            user table
 *
 *  @return new user table
 */
-(instancetype) initWithUserTable: (GPKGUserTable *) userTable;

/**
 * Get the contents data type
 *
 * @return data type
 */
-(NSString *) dataType;

/**
 *  Check for duplicate column names
 *
 *  @param index         index
 *  @param previousIndex previous index
 *  @param column        column
 */
-(void) duplicateCheckWithIndex: (int) index andPreviousIndex: (NSNumber *) previousIndex andColumn: (NSString *) column;

/**
 *  Check for the expected data type
 *
 *  @param expected expected data type
 *  @param column   column
 */
-(void) typeCheckWithExpected: (enum GPKGDataType) expected andColumn: (GPKGUserColumn *) column;

/**
 *  Check for missing columns
 *
 *  @param index  index
 *  @param column column
 */
-(void) missingCheckWithIndex: (NSNumber *) index andColumn: (NSString *) column;

/**
 *  Get the column index of the column name
 *
 *  @param columnName column name
 *
 *  @return index
 */
-(int) getColumnIndexWithColumnName: (NSString *) columnName;

/**
 * Get the array of column names
 *
 * @return column names
 */
-(NSArray<NSString *> *) columnNames;

/**
 *  Get the column name at the index
 *
 *  @param index index
 *
 *  @return column name
 */
-(NSString *) getColumnNameWithIndex: (int) index;

/**
 * Get the list of columns
 *
 * @return columns
 */
-(NSArray<GPKGUserColumn *> *) columns;

/**
 *  Get the column at the index
 *
 *  @param index index
 *
 *  @return column
 */
-(GPKGUserColumn *) getColumnWithIndex: (int) index;

/**
 *  Get the column of the column name
 *
 *  @param columnName column name
 *
 *  @return column
 */
-(GPKGUserColumn *) getColumnWithColumnName: (NSString *) columnName;

/**
 * Check if the table has the column
 *
 * @param columnName
 *            column name
 * @return true if has the column
 */
-(BOOL) hasColumnWithColumnName: (NSString *) columnName;

/**
 *  Get the column count
 *
 *  @return column count
 */
-(int) columnCount;

/**
 * Check if the table has a primary key column
 *
 * @return true if has a primary key
 */
-(BOOL) hasPkColumn;

/**
 * Get the primary key column index
 *
 * @return primary key column index
 */
-(int) pkIndex;

/**
 *  Get the primary key column index
 *
 *  @return pk index
 */
-(GPKGUserColumn *) getPkColumn;

/**
 *  Add constraint
 *
 *  @param constraint constraint
 */
-(void) addConstraint: (GPKGConstraint *) constraint;

/**
 * Add constraints
 *
 * @param constraints
 *            constraints
 */
-(void) addConstraints: (NSArray<GPKGConstraint *> *) constraints;

/**
 * Check if has constraints
 *
 * @return true if has constraints
 */
-(BOOL) hasConstraints;

/**
 * Get the constraints
 *
 * @return constraints
 */
-(NSArray<GPKGConstraint *> *) constraints;

/**
 * Get the constraints of the provided type
 *
 * @param type
 *            constraint type
 * @return constraints
 */
-(NSArray<GPKGConstraint *> *) constraintsForType: (enum GPKGConstraintType) type;

/**
 * Clear the constraints
 *
 * @return cleared constraints
 */
-(NSArray<GPKGConstraint *> *) clearConstraints;

/**
 * Get the columns with the provided data type
 *
 * @param type
 *            data type
 * @return columns
 */
-(NSArray *) columnsOfType: (enum GPKGDataType) type;

/**
 * Add a new column
 *
 * @param column
 *            new column
 */
-(void) addColumn: (GPKGUserColumn *) column;

/**
 * Rename a column
 *
 * @param column
 *            column
 * @param newColumnName
 *            new column name
 */
-(void) renameColumn: (GPKGUserColumn *) column toColumn: (NSString *) newColumnName;

/**
 * Rename a column
 *
 * @param columnName
 *            column name
 * @param newColumnName
 *            new column name
 */
-(void) renameColumnWithName: (NSString *) columnName toColumn: (NSString *) newColumnName;

/**
 * Rename a column
 *
 * @param index
 *            column index
 * @param newColumnName
 *            new column name
 */
-(void) renameColumnWithIndex: (int) index toColumn: (NSString *) newColumnName;

/**
 * Drop a column
 *
 * @param column
 *            column to drop
 */
-(void) dropColumn: (GPKGUserColumn *) column;

/**
 * Drop a column
 *
 * @param columnName
 *            column name
 */
-(void) dropColumnWithName: (NSString *) columnName;

/**
 * Drop a column
 *
 * @param index
 *            column index
 */
-(void) dropColumnWithIndex: (int) index;

/**
 * Alter a column
 *
 * @param column
 *            altered column
 */
-(void) alterColumn: (GPKGUserColumn *) column;

@end
