---
title: C++ Cheatsheet
---

# C++ Cheatsheet

### Vector

```cpp
// ═════╣ **Initialisation ╠═════ \\** 
vector<int> v;
vector<int> v(5);        // Size 5 vector populated with 0s
vector<int> v(5, 10);    // Size 5 vector populated with 10s

****// ═════╣ **Adding Elements ╠═════ \\** 
// When inserting at a position, you have to give an iterator
**insert**(posIter, value)
**insert**(posIter, { v1, v2, ... })
**insert**(startPos, other.startPos, other.endPos)   // Useful for concatenating vectors.

// Examples:
insert(v.begin() + 2, 10)            // Inserts 10 at index 2
insert(v.begin() + 2, {10, 10, 10})  // Inserts 10, 10, 10 starting from index 2

****// ═════╣ **Reading/Updating Elements ╠═════ \\** 
// Use the subscript operator [].
v[i]         
v[i] = n;     

****// ═════╣ **Deleting Elements ╠═════ \\** 
**erase**(posIter)             // Deletes a single element
**erase**(startIter, endIter)  // Deletes a range of elements, **[start, end)**

**clear**()         // Removes everything, makes size 0

****// ═════╣ **Operators ╠═════ \\ 

v1 == v2**        // Does an equality on the contents, not the memory address!
                // This will first check the sizes match, then loop through each element and check each of those match.
                // This also works when comparing matrices!
```

### Matrix

```cpp
vector<vector<int>> **M(10, vector<int>(5))**    // Creates a matrix with **10** rows, **5** columns, **all values set to 0**

**M == N**     // Matrix equality: check all contents of M and N are equal with the **==** operator.
```

### String

`std::string`'s methods are a superset of the `std::vector`’s methods. These are some specific methods to know:

```cpp
**substr**(startIndex, runLen)     // Returns a new string from startIndex onwards for runLen characters.

s1 == s2       // String equality works.
s1 += s2       // String concatenation works.
```

### Map

For unordered maps:

```cpp
// ═════╣ **Reading/Updating/Adding ╠═════ \\** 
m[k] = v;

// ═════╣ **Deleting Elements ╠═════ \\** 
m.erase(k)     // Returns number of deleted entries. This is can be 0 if k doesn't exist in m
m.clear()

// ═════╣ **Iterate ╠═════ \\** 
for (const auto& [k, v] : m) {
    // ...
}

// ═════╣ **Key Exists ╠═════ \\**
if (m.find(k) != m.end()) {
		// k exists in map
}
```

Initialising a map

Initialising a static member of a class.

### Stack, Queue

```cpp
s.push(val);     // Basically vector::push_back(val)
s.pop();         // Does not return anything. Just removes to elem
s.top();         // Peek top, but don't pop
s.size();        
s.empty();       // Whether stack is empty
```

```cpp
q.push(val);
q.pop();
q.front();
q.back();
q.size();
q.empty();
```

### Set

```cpp
// ═════╣ **Adding Element ╠═════ \\**
s.insert(val);

// ═════╣ **Exists ╠═════ \\**
if (s.find(val) != s.end()) {
    // val exists
}

// ═════╣ **Deleting Elements ╠═════ \\**
s.erase();
s.clear();
```

### Reading Input

```cpp
int i;
double j;
cin >> i >> j;     // Expects an int, then a double after 1 or more of \s characters (space, tab, newline)

// ...

string message;
getline(cin, message)    // Reads an entire line up to **but not including** the newline character
```

- On failure to read, they’ll just be uninitialised

When reading formatted input and then unformatted input, you’ll need to call the `ignore` method, `std::cin.ignore()`, in between.

```cpp
cin >> age;
cin.ignore();
getline(cin, name);
```

### Algorithm

```cpp
#include <**algorithm**>

// ═════╣ **Frequent Methods ╠═════ \\** 
**sort**(start_iter, end_iter);                    // Works with strings as well.
**stable_sort**(start_iter, end_iter);

**fill**(start_iter, end_iter, 10);                // Fills a vector range with 10s
																			         // Note: vectors give you a constructor that lets you fill it with values.
																			         //       This is mainly useful for arrays.

**find**(start_iter, end_iter, target_value);      // Note: maps, sets, etc. would have their own find method.
																							 //       These are useful when working with vectors.
**find_if**(start_iter, end_iter, predicate);      // Where predicate is a function that takes in an element of the     
                                               // container and returns true/false for whether it should be returned.
                                               // `find_if` returns an iterator.

**iter_swap**(start_iter, end_iter)                // Swaps the element at the given iterator positions. Saves you some time
                                               // from writing a swap function yourself.

// ═════╣ **Functional Programming ╠═════ \\** 
vector<int> v = {1, 2, 3, 4, 5, 6, 7, 8};
vector<int> u;

// **Map**
**transform**(v.begin(), v.end(), **back_inserter(u)**, **[[]] { return val + 1; }**);

// **Filter**
**copy_if**(v.begin(), v.end(), **back_inserter(u)**, **[[]] { return val % 2 == 0; }**);

// Note: for **reduce**, see either **std::accumulate** or **std::reduce**.

// ═════╣ **Binary Search ╠═════ \\** 
// These should be executed on **sorted** ranges.

**lower_bound**(start_iter, end_iter, target)      // If `target` exists, returns the index of `target`.
                                               // Else, return the index where we would expect it to be.
                                               // Ie. this function gives you the index of the **greatest value less than `target`**.

**upper_bound**(start_iter, end_iter, target)      // If `target` exists, returns the index of `target` + 1.
                                               // Else, return the index where we would expect it to be.
                                               // Ie. this function gives you the index of the **smallest value greater than `target`**.
```

### Iterators

```cpp

vector<int> A = {5, 3, 7, 6, 2};
vector<int>::iterator it1;
vector<int>::iterator it2;

it1 = A.begin() **+ 2**;           // You can + ints to an iterator.
                               // `it1` points to index 2.
it2 =   A.end() **- 1**;           // You can - ints to an iterator.
															 // `it2` points to index 4.

int index_diff = **it2 - it1**;    // You can subtract 2 iterators to get the difference in position.
															 // Here, `it2 - it1` gives 2

if (it1 **<=** it2)                // You can compare the position of two iterators. Here, `it1` is 2 positions earlier than `it2`.
		cout << "it1 before it2" << endl;

it1**++**;                         // ++ also works.
it1**--**;                         // -- also works.

int value = *****it;               // Dereferencing an iterator gives you the value the iterator 'points' to.
```

### Missing String Functions

```cpp
// C++ has no split function... this is one option you can take:
//     Put the string into an istringstream and use formatted extraction to taken
//     out the tokens and append them to the end of a vector.
void **split**(const string& str, vector<string>& tokens) {
    stringstream iss(str);
    copy(istream_iterator<string>(iss), istream_iterator<string>(), back_inserter(tokens));
}

```

### Typecasting & Data Structure Conversion

```cpp
// **string** → **int**        **Use stoi**
string s = "123";
int val = stoi(s);

// **char** → **int          Subtract ASCII base**
char c = '5';
int val = c - '0';

// **int** → **string        Use to_string**
int val = 123;
string s = to_string(val);

**// char → string       Use initialiser list**
char c = 'a';
string s = {c};

// **vector** → **set                 Use the range constructor of set**
vector<int> v = {1, 2, 3};
unordered_set<int> s**(v.begin(), v.end())**;

// **set** → **vector                 Use the range constructor of vector**
unordered_set<int> s = {1, 2, 3};
vector<int> v**(s.begin(), s.end())**;
```

## **Tidbits**
- Under the hood, `vector::clear` may not actually clear out values from the vector.
- Careful, you’ll get a segfault when the iterator is out of bounds. Eg. v.begin() + 1 in an empty vector.
- The reason this doesn't return a value is because of exception safety.
- Vector, map and set all share some common method names: insert, erase, clear, size, etc.
