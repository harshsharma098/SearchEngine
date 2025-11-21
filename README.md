# C++ Search Engine with Qt GUI

An intermediate-level C++ search engine application featuring a modern Qt-based GUI. The engine indexes multiple text files, tokenizes content, removes stop-words, and ranks search results using TF-IDF (Term Frequency-Inverse Document Frequency) scoring.

## Features

- **Document Indexing**: Load and index multiple text files
- **Tokenization**: Breaks text into words, handling punctuation and case normalization
- **Stop Word Removal**: Filters out common words that don't contribute to search relevance
- **TF-IDF Ranking**: Uses advanced ranking algorithm to score document relevance
- **Modern GUI**: Responsive Qt-based interface with:
  - Search bar with real-time query processing
  - Results list showing ranked documents with scores
  - Document preview pane
  - File loading dialog
  - Status messages and progress indicators
- **Modular Architecture**: Well-organized classes for maintainability and extensibility

## Architecture

### Core Components

1. **Tokenizer** (`core/Tokenizer.h/cpp`)
   - Splits text into tokens (words)
   - Handles punctuation and case normalization
   - Filters out single-character tokens

2. **StopWordRemover** (`core/StopWordRemover.h/cpp`)
   - Maintains a set of common English stop words
   - Filters tokens to improve search quality

3. **DocumentIndexer** (`core/DocumentIndexer.h/cpp`)
   - Reads and indexes text files
   - Builds term frequency maps for each document
   - Manages document collection

4. **TFIDFCalculator** (`core/TFIDFCalculator.h/cpp`)
   - Calculates Term Frequency (TF) for terms in documents
   - Calculates Inverse Document Frequency (IDF) for terms
   - Computes TF-IDF scores for ranking

5. **SearchEngine** (`core/SearchEngine.h/cpp`)
   - Orchestrates indexing and searching operations
   - Processes queries and returns ranked results
   - Main interface for search functionality

6. **MainWindow** (`gui/MainWindow.h/cpp`)
   - Qt-based GUI application
   - Handles user interactions
   - Displays search results and document previews

## Project Structure

```
SearchEngine/
├── CMakeLists.txt          # Build configuration
├── README.md               # This file
├── include/
│   ├── core/
│   │   ├── Tokenizer.h
│   │   ├── StopWordRemover.h
│   │   ├── DocumentIndexer.h
│   │   ├── TFIDFCalculator.h
│   │   └── SearchEngine.h
│   └── gui/
│       └── MainWindow.h
├── src/
│   ├── core/
│   │   ├── Tokenizer.cpp
│   │   ├── StopWordRemover.cpp
│   │   ├── DocumentIndexer.cpp
│   │   ├── TFIDFCalculator.cpp
│   │   └── SearchEngine.cpp
│   └── gui/
│       ├── main.cpp
│       └── MainWindow.cpp
└── data/
    ├── sample1.txt
    ├── sample2.txt
    ├── sample3.txt
    ├── sample4.txt
    └── sample5.txt
```

## Prerequisites

- **C++ Compiler**: GCC 7+ or MSVC 2017+ with C++17 support
- **CMake**: Version 3.16 or higher
- **Qt**: Version 5.12+ or Qt 6.x
  - Required components: Core, Widgets

### Installing Qt

#### Windows
1. Download Qt from [qt.io](https://www.qt.io/download)
2. Install Qt with Qt Creator or standalone installer
3. Ensure Qt is added to your PATH, or set `CMAKE_PREFIX_PATH` to Qt installation

#### Linux (Ubuntu/Debian)
```bash
sudo apt-get update
sudo apt-get install qt6-base-dev qt6-base-dev-tools cmake build-essential
```

#### macOS
```bash
brew install qt6 cmake
```

## Building the Project

### Using CMake (Recommended)

1. **Create build directory:**
   ```bash
   mkdir build
   cd build
   ```

2. **Configure CMake:**
   ```bash
   cmake ..
   ```
   
   If Qt is not found automatically, specify the path:
   ```bash
   cmake -DCMAKE_PREFIX_PATH=/path/to/qt ..
   ```

3. **Build the project:**
   ```bash
   cmake --build .
   ```
   
   Or use your system's build tool:
   - **Windows (Visual Studio):** Open the generated `.sln` file
   - **Linux/macOS:** `make`

4. **Run the application:**
   ```bash
   ./bin/SearchEngine    # Linux/macOS
   # or
   bin\SearchEngine.exe  # Windows
   ```

### Alternative: Using Qt Creator

1. Open Qt Creator
2. File → Open File or Project → Select `CMakeLists.txt`
3. Configure the project (select Qt version and compiler)
4. Build (Ctrl+B / Cmd+B)
5. Run (Ctrl+R / Cmd+R)

## Usage

### Running the Application

1. Launch the SearchEngine executable
2. Click **"Load Files"** to select text files to index
3. Enter a search query in the search bar
4. Click **"Search"** or press Enter
5. View ranked results in the results list
6. Click on a result to preview the document content

### Sample Data

The `data/` directory contains sample text files covering topics like:
- Artificial Intelligence and Machine Learning
- Web Development
- Data Structures and Algorithms
- Software Engineering
- Database Systems

You can use these for testing or load your own text files.

### Search Tips

- The engine automatically removes stop words from queries
- Results are ranked by TF-IDF relevance score (higher is better)
- Multi-word queries search for all terms and rank by combined score
- Case-insensitive searching

## How TF-IDF Works

**Term Frequency (TF):** Measures how frequently a term appears in a document, normalized by document length.

```
TF(term, document) = (Number of times term appears in document) / (Total terms in document)
```

**Inverse Document Frequency (IDF):** Measures how rare or common a term is across all documents.

```
IDF(term) = log(Total documents / Documents containing term)
```

**TF-IDF Score:** Combines both metrics to rank document relevance.

```
TF-IDF(term, document) = TF(term, document) × IDF(term)
```

Documents with higher TF-IDF scores are considered more relevant to the query.

## Extending the Project

### Adding New Features

- **Stemming/Lemmatization**: Normalize word variations (e.g., "running" → "run")
- **Phrase Search**: Support for exact phrase matching
- **Boolean Operators**: AND, OR, NOT query support
- **Highlighting**: Highlight matching terms in document preview
- **Export Results**: Save search results to file
- **Index Persistence**: Save/load index to avoid re-indexing

### Code Organization

The project follows a modular design:
- Core search functionality is separated from GUI
- Each component has a single responsibility
- Easy to test individual components
- Can be extended without modifying existing code

## Troubleshooting

### Qt Not Found
- Ensure Qt is installed and in your PATH
- Set `CMAKE_PREFIX_PATH` to Qt installation directory
- On Windows, check that Qt bin directory is in PATH

### Build Errors
- Verify C++17 compiler support
- Ensure all Qt components (Core, Widgets) are installed
- Check CMake version (3.16+)

### Runtime Errors
- Ensure text files are readable
- Check file paths are correct
- Verify Qt libraries are accessible at runtime

## License

This project is provided as an educational example. Feel free to modify and extend it for your own use.

## Contributing

This is a demonstration project. Suggestions and improvements are welcome!

## Author

Created as an intermediate-level C++ project demonstrating:
- Modern C++ features (C++17)
- Qt GUI development
- Information retrieval algorithms
- Software architecture and design patterns

---

**Enjoy searching!** 🔍

