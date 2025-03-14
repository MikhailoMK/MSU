package main;

import javax.swing.*;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;
import javax.swing.filechooser.FileNameExtensionFilter;
import javax.swing.text.*;
import javax.swing.undo.UndoManager;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.print.PrinterException;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;
import java.util.regex.Pattern;
import java.util.Timer;
import java.util.TimerTask;

public class Main {
    static final JFrame frame = new JFrame("Text Editor");
    static final JTextPane editorPane = new JTextPane();
    static final Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
    static final JLabel statusLabel = new JLabel("Статус: ");
    static File currentFile = null;
    static final UndoManager undoManager = new UndoManager();

    static String lastSearchText = "";
    static int lastSearchIndex = -1;
    private static SimpleAttributeSet copiedAttributes = new SimpleAttributeSet();
    static Properties settings = new Properties();

    private static final int PAGE_HEIGHT = 800;
    private static int currentPage = 0;

    public static void main(String[] args) {
        loadSettings();
        frame.setSize(screenSize.width, screenSize.height - 100);
        frame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        frame.setLayout(new BorderLayout());

        editorPane.setContentType("text/plain");
        editorPane.setEditable(true);
        editorPane.setFont(new Font(settings.getProperty("fontName", "Times New Roman"), Font.PLAIN, Integer.parseInt(settings.getProperty("fontSize", "14"))));

        editorPane.setEditorKit(new javax.swing.text.StyledEditorKit());
        editorPane.putClientProperty(JEditorPane.HONOR_DISPLAY_PROPERTIES, Boolean.TRUE);

        editorPane.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));
        JScrollPane scrollPane = new JScrollPane(editorPane);
        scrollPane.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
        frame.add(scrollPane, BorderLayout.CENTER);

        addToolBar();

        boolean standardMenu = false;

        if (standardMenu) {
            addStandardMenu();
        } else {
            addWordLikeMenu();
        }
        addFooterPanel();

        editorPane.getInputMap(JComponent.WHEN_FOCUSED).put(KeyStroke.getKeyStroke(KeyEvent.VK_S, KeyEvent.CTRL_DOWN_MASK), "saveFile");
        editorPane.getActionMap().put("saveFile", new AbstractAction() {
            @Override
            public void actionPerformed(ActionEvent e) {
                saveFile(false);
            }
        });

        Timer autoSaveTimer = new Timer();
        autoSaveTimer.schedule(new TimerTask() {
            @Override
            public void run() {
                saveFile(false);
            }
        }, 300000, 300000);

        editorPane.getDocument().addDocumentListener(new DocumentListener() {
            @Override
            public void insertUpdate(DocumentEvent e) {
                System.out.println("Insert update");
                updateStatus();
            }

            @Override
            public void removeUpdate(DocumentEvent e) {
                System.out.println("Remove update");
                updateStatus();
            }

            @Override
            public void changedUpdate(DocumentEvent e) {
                System.out.println("Changed update");
                updateStatus();
            }
        });

        addContextMenu();

        updateStatus();

        editorPane.addCaretListener(e -> updateStatus());

        frame.setVisible(true);
    }


    static void addStandardMenu() {
        JMenuBar menuBar = new JMenuBar();

        JMenu fileMenu = new JMenu("Файл");
        fileMenu.add(createMenuItem("Создать", e -> createNewFile()));
        fileMenu.add(createMenuItem("Открыть", e -> openFile()));
        fileMenu.add(createMenuItem("Сохранить", e -> saveFile(false)));

        JMenu editMenu = new JMenu("Изменить");
        editMenu.add(new DefaultEditorKit.CutAction()).setText("Вырезать");
        editMenu.add(new DefaultEditorKit.CopyAction()).setText("Копировать");
        editMenu.add(new DefaultEditorKit.PasteAction()).setText("Вставить");
        editMenu.add(createMenuItem("Удалить", e -> deleteNextChar()));
        editMenu.add(createMenuItem("Найти", e -> findText()));
        editMenu.add(createMenuItem("Найти далее", e -> findNext()));
        editMenu.add(createMenuItem("Найти ранее", e -> findPrevious()));
        editMenu.add(createMenuItem("Заменить", e -> replaceText()));
        editMenu.add(createMenuItem("Перейти", e -> goToLine()));
        editMenu.add(createMenuItem("Выбрать все", e -> selectAllText()));
        editMenu.add(createMenuItem("Дата и время", e -> insertDateTime()));

        JMenu setting = new JMenu("Настройки");
        setting.add(createMenuItem("Цвет текста", e -> changeTextColor()));
        setting.add(createMenuItem("Цвет фона", e -> changeBackgroundColor()));

        menuBar.add(fileMenu);
        menuBar.add(editMenu);
        menuBar.add(setting);

        frame.setJMenuBar(menuBar);
    }

    private static JMenuItem createMenuItem(String text, ActionListener action) {
        JMenuItem menuItem = new JMenuItem(text);
        menuItem.addActionListener(action);
        return menuItem;
    }

    static JLabel pageCounterLabel = new JLabel("Страница: 1");

    static void addFooterPanel() {
        JPanel footerPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        pageCounterLabel = new JLabel("Страница: 1");
        footerPanel.add(pageCounterLabel);
        footerPanel.add(statusLabel);
        frame.add(footerPanel, BorderLayout.SOUTH);
    }

    private static void updateStatus() {
        try {
            String text = editorPane.getDocument().getText(0, editorPane.getDocument().getLength());

            int paragraphs = text.split("\n").length;

            int words = text.trim().isEmpty() ? 0 : text.trim().split("\\s+").length;

            int characters = text.length();

            int charactersWithoutSpaces = text.replace(" ", "").length();

            int sentences = text.split("[.!?]").length;

            int specialCharacters = text.replaceAll("[\\w\\s]", "").length();

            int latinLetters = text.replaceAll("[^A-Za-z]", "").length();

            int russianLetters = text.replaceAll("[^А-Яа-яЁё]", "").length();

            int digits = text.replaceAll("[^0-9]", "").length();

            int punctuationMarks = text.replaceAll("[^.,!?;:\\-()\"']", "").length();

            statusLabel.setText(
                    String.format("Абзацы: %d | Предложения: %d | Слова: %d | Символы: %d | Символы без пробелов: %d | " +
                                    "Спец. символы: %d | Лат. буквы: %d | Рус. буквы: %d | Цифры: %d | Знаки препинания: %d",
                            paragraphs, sentences, words, characters, charactersWithoutSpaces, specialCharacters, latinLetters, russianLetters, digits, punctuationMarks)
            );

            updatePageStatus();

        } catch (BadLocationException e) {
            e.printStackTrace();
        }
    }

    private static void updatePageStatus() {
        try {
            int caretPosition = editorPane.getCaretPosition();
            Rectangle caretRectangle = editorPane.modelToView(caretPosition);
            if (caretRectangle != null) {
                int yPosition = caretRectangle.y;
                currentPage = (yPosition / PAGE_HEIGHT) + 1;
                pageCounterLabel.setText("Страница: " + currentPage);
            }
        } catch (BadLocationException e) {
            e.printStackTrace();
        }
    }


    private static void createNewFile() {
        editorPane.setText("");
        currentFile = null;
        frame.setTitle("TextEditor - Новый файл");
        updateStatus();
    }

    private static void openFile() {
        JFileChooser fileChooser = new JFileChooser();
        fileChooser.setFileFilter(new FileNameExtensionFilter("Текстовые файлы (*.txt)", "txt"));
        int option = fileChooser.showOpenDialog(frame);
        if (option == JFileChooser.APPROVE_OPTION) {
            currentFile = fileChooser.getSelectedFile();
            try (BufferedReader reader = new BufferedReader(new FileReader(currentFile))) {
                editorPane.read(reader, null);
                frame.setTitle("Text Editor - " + currentFile.getName());
            } catch (IOException ex) {
                JOptionPane.showMessageDialog(frame, "Ошибка при открытии файла.");
            }
            updateStatus();
        }
    }

    private static void saveFile(boolean saveAs) {
    if (saveAs || currentFile == null) {
        JFileChooser fileChooser = new JFileChooser();
        fileChooser.setFileFilter(new FileNameExtensionFilter("Текстовые файлы (*.txt)", "txt"));
        int option = fileChooser.showSaveDialog(frame);
        if (option == JFileChooser.APPROVE_OPTION) {
            currentFile = fileChooser.getSelectedFile();
            if (!currentFile.getName().endsWith(".txt")) {
                currentFile = new File(currentFile.getParent(), currentFile.getName() + ".txt");
            }
        } else {
            return;
        }
    }
    
    try (BufferedWriter writer = new BufferedWriter(new FileWriter(currentFile))) {
        editorPane.write(writer);
        frame.setTitle("Text Editor - " + currentFile.getName());
    } catch (IOException ex) {
        JOptionPane.showMessageDialog(frame, "Ошибка при сохранении файла.");
    }
}

    private static void deleteNextChar() {
        int position = editorPane.getCaretPosition();
        try {
            if (position < editorPane.getDocument().getLength()) {
                editorPane.getDocument().remove(position, 1);
            } else {
                Toolkit.getDefaultToolkit().beep();
            }
        } catch (Exception e) {
            Toolkit.getDefaultToolkit().beep();
        }
    }

    private static void findText() {
        String searchText = JOptionPane.showInputDialog(frame, "\u0412\u0432\u0435\u0434\u0438\u0442\u0435 \u0442\u0435\u043a\u0441\u0442 \u0434\u043b\u044f \u043f\u043e\u0438\u0441\u043a\u0430:");
        if (searchText != null && !searchText.isEmpty()) {
            lastSearchText = searchText;
            lastSearchIndex = -1;
            highlightSearchResults(searchText);
            findNext();
        }
    }

    private static void findNext() {
        if (lastSearchText == null || lastSearchText.isEmpty()) {
            JOptionPane.showMessageDialog(frame, "Сначала используйте функцию 'Найти'.");
            return;
        }

        try {
            removeCurrentHighlight(editorPane);

            String text = editorPane.getDocument().getText(0, editorPane.getDocument().getLength());

            // Ищем следующий индекс, начиная с последнего найденного, с учетом цикличности
            lastSearchIndex = text.indexOf(lastSearchText, lastSearchIndex + 1);

            if (lastSearchIndex == -1) {
                lastSearchIndex = text.indexOf(lastSearchText, 0);
                if (lastSearchIndex == -1) {
                    JOptionPane.showMessageDialog(frame, "Текст не найден.");
                    return;
                }
            }

            removeSpecificHighlight(editorPane, lastSearchIndex, lastSearchIndex + lastSearchText.length());
            setCurrentHighlight(lastSearchIndex, lastSearchIndex + lastSearchText.length());

            editorPane.setCaretPosition(lastSearchIndex);
            editorPane.scrollRectToVisible(editorPane.modelToView(lastSearchIndex));

        } catch (Exception e) {
            JOptionPane.showMessageDialog(frame, "Ошибка при поиске текста.");
        }
    }


    private static void findPrevious() {
        if (lastSearchText == null || lastSearchText.isEmpty()) {
            JOptionPane.showMessageDialog(frame, "Сначала используйте функцию 'Найти'.");
            return;
        }

        try {
            removeCurrentHighlight(editorPane);

            String text = editorPane.getDocument().getText(0, editorPane.getDocument().getLength());

            lastSearchIndex = text.lastIndexOf(lastSearchText, lastSearchIndex - 1);

            if (lastSearchIndex == -1) {
                lastSearchIndex = text.lastIndexOf(lastSearchText, text.length() - 1);
                if (lastSearchIndex == -1) {
                    JOptionPane.showMessageDialog(frame, "Текст не найден.");
                    return;
                }
            }

            removeSpecificHighlight(editorPane, lastSearchIndex, lastSearchIndex + lastSearchText.length());
            setCurrentHighlight(lastSearchIndex, lastSearchIndex + lastSearchText.length());

            editorPane.setCaretPosition(lastSearchIndex);
            editorPane.scrollRectToVisible(editorPane.modelToView(lastSearchIndex));

        } catch (Exception e) {
            JOptionPane.showMessageDialog(frame, "Ошибка при поиске текста.");
        }
    }

    
    private static void removeSpecificHighlight(JTextComponent textComp, int start, int end) {
        Highlighter highlighter = textComp.getHighlighter();
        Highlighter.Highlight[] highlights = highlighter.getHighlights();

        for (Highlighter.Highlight highlight : highlights) {
            if (highlight.getPainter() == allMatchesHighlighter && highlight.getStartOffset() == start && highlight.getEndOffset() == end) {
                highlighter.removeHighlight(highlight);
                break;
            }
        }
    }

    private static void highlightSearchResults(String searchText) {
        removeHighlights(editorPane);

        try {
            Highlighter highlighter = editorPane.getHighlighter();
            Document doc = editorPane.getDocument();
            String text = doc.getText(0, doc.getLength());
            int pos = 0;

            while ((pos = text.indexOf(searchText, pos)) >= 0) {
                highlighter.addHighlight(pos, pos + searchText.length(), allMatchesHighlighter);
                pos += searchText.length();
            }
        } catch (BadLocationException e) {
            e.printStackTrace();
        }
    }

    private static void setCurrentHighlight(int start, int end) {
        try {
            Highlighter highlighter = editorPane.getHighlighter();
            currentHighlight = highlighter.addHighlight(start, end, currentMatchHighlighter);
        } catch (BadLocationException e) {
            e.printStackTrace();
        }
    }

    private static void removeHighlights(JTextComponent textComp) {
        Highlighter highlighter = textComp.getHighlighter();
        Highlighter.Highlight[] highlights = highlighter.getHighlights();

        for (Highlighter.Highlight highlight : highlights) {
            if (highlight.getPainter() == allMatchesHighlighter) {
                highlighter.removeHighlight(highlight);
            }
        }
    }

    private static void removeCurrentHighlight(JTextComponent textComp) {
        if (currentHighlight != null) {
            Highlighter highlighter = textComp.getHighlighter();
            highlighter.removeHighlight(currentHighlight);
            currentHighlight = null;
        }
    }

    private static Object currentHighlight = null;

    private static final Highlighter.HighlightPainter allMatchesHighlighter = new DefaultHighlighter.DefaultHighlightPainter(Color.YELLOW);
    private static final Highlighter.HighlightPainter currentMatchHighlighter = new DefaultHighlighter.DefaultHighlightPainter(Color.RED);


    private static void replaceText() {
        JPanel panel = new JPanel(new GridLayout(3, 2));
        JTextField findField = new JTextField(10);
        JTextField replaceField = new JTextField(10);

        panel.add(new JLabel("Заменить:"));
        panel.add(findField);
        panel.add(new JLabel("На что:"));
        panel.add(replaceField);

        JPanel buttonPanel = new JPanel(new FlowLayout());
        JButton replaceButton = new JButton("Заменить");
        JButton nextButton = new JButton("Следующее");
        JButton prevButton = new JButton("Предыдущее");
        JButton replaceAllButton = new JButton("Заменить все");

        buttonPanel.add(replaceButton);
        buttonPanel.add(nextButton);
        buttonPanel.add(prevButton);
        buttonPanel.add(replaceAllButton);

        JPanel dialogPanel = new JPanel(new BorderLayout());
        dialogPanel.add(panel, BorderLayout.CENTER);
        dialogPanel.add(buttonPanel, BorderLayout.SOUTH);

        int option = JOptionPane.showConfirmDialog(frame, dialogPanel, "Заменить текст", JOptionPane.OK_CANCEL_OPTION);

        if (option != JOptionPane.OK_OPTION) {
            return;
        }

        String findText = findField.getText();
        String replaceText = replaceField.getText();
        if (findText.isEmpty()) {
            JOptionPane.showMessageDialog(frame, "Поле для поиска не может быть пустым.");
            return;
        }

        try {
            String content = editorPane.getDocument().getText(0, editorPane.getDocument().getLength());

            int currentIndex = 0;

            replaceButton.addActionListener(e -> {
                int foundIndex = content.indexOf(findText, currentIndex);
                if (foundIndex != -1) {
                    StringBuilder newContent = new StringBuilder(content);
                    newContent.replace(foundIndex, foundIndex + findText.length(), replaceText);
                    editorPane.setText(newContent.toString());
                    currentIndex = foundIndex + replaceText.length();
                } else {
                    JOptionPane.showMessageDialog(frame, "Не найдено вхождений.");
                }
            });

            nextButton.addActionListener(e -> {
                int foundIndex = content.indexOf(findText, currentIndex);
                if (foundIndex != -1) {
                    currentIndex = foundIndex;
                } else {
                    JOptionPane.showMessageDialog(frame, "Не найдено следующего вхождения.");
                }
            });

            prevButton.addActionListener(e -> {
                int foundIndex = content.lastIndexOf(findText, currentIndex - 1);
                if (foundIndex != -1) {
                    currentIndex = foundIndex;
                } else {
                    JOptionPane.showMessageDialog(frame, "Не найдено предыдущего вхождения.");
                }
            });

            replaceAllButton.addActionListener(e -> {
                String newContent = content.replaceAll(Pattern.quote(findText), replaceText);
                editorPane.setText(newContent);
                JOptionPane.showMessageDialog(frame, "Все вхождения заменены.");
            });

        } catch (BadLocationException e) {
            JOptionPane.showMessageDialog(frame, "Ошибка при чтении текста.");
        }
    }



    private static void goToLine() {
        String lineStr = JOptionPane.showInputDialog(frame, "Введите номер строки:");
        try {
            int line = Integer.parseInt(lineStr);

            Element root = editorPane.getDocument().getDefaultRootElement();

            if (line < 1 || line > root.getElementCount()) {
                throw new IndexOutOfBoundsException("Неверный номер строки");
            }

            int position = root.getElement(line - 1).getStartOffset();

            editorPane.setCaretPosition(position);

            editorPane.scrollRectToVisible(editorPane.modelToView(position));

            editorPane.requestFocusInWindow();
        } catch (NumberFormatException e) {
            JOptionPane.showMessageDialog(frame, "Введите корректное числовое значение.");
        } catch (IndexOutOfBoundsException e) {
            JOptionPane.showMessageDialog(frame, "Неверный номер строки.");
        } catch (Exception e) {
            JOptionPane.showMessageDialog(frame, "Ошибка при переходе к строке.");
        }
    }

    private static void selectAllText() {
        editorPane.requestFocusInWindow();
        editorPane.selectAll();
    }

    private static void insertDateTime() {
        SimpleDateFormat formatter = new SimpleDateFormat("dd.MM.yyyy HH:mm:ss");
        String dateTime = formatter.format(new Date());

        int position = editorPane.getCaretPosition();
        try {
            if (position < 0 || position > editorPane.getDocument().getLength()) {
                throw new BadLocationException("Неверная позиция вставки", position);
            }

            editorPane.getDocument().insertString(position, dateTime, null);
        } catch (BadLocationException e) {
            JOptionPane.showMessageDialog(frame, "Ошибка при вставке даты и времени: неверная позиция.");
        } catch (Exception e) {
            JOptionPane.showMessageDialog(frame, "Ошибка при вставке даты и времени.");
        }
    }

    private static void changeTextColor() {
        Color newColor = JColorChooser.showDialog(frame, "Выберите цвет текста", editorPane.getForeground());
        if (newColor != null) {
            int start = editorPane.getSelectionStart();
            int end = editorPane.getSelectionEnd();

            if (start != end) {
                StyledDocument doc = (StyledDocument) editorPane.getDocument();
                SimpleAttributeSet attr = new SimpleAttributeSet();
                StyleConstants.setForeground(attr, newColor);
                doc.setCharacterAttributes(start, end - start, attr, false);
            } else {
                JOptionPane.showMessageDialog(frame, "Пожалуйста, выделите текст для изменения цвета.");
            }
        }
    }

    private static void changeBackgroundColor() {
        Color newColor = JColorChooser.showDialog(frame, "Выберите цвет фона", editorPane.getBackground());
        if (newColor != null) {
            int start = editorPane.getSelectionStart();
            int end = editorPane.getSelectionEnd();

            if (start != end) {
                StyledDocument doc = (StyledDocument) editorPane.getDocument();
                SimpleAttributeSet attr = new SimpleAttributeSet();
                StyleConstants.setBackground(attr, newColor);

                doc.setCharacterAttributes(start, end - start, attr, false);
            } else {
                editorPane.setBackground(newColor);
            }
        }
    }

    static void addWordLikeMenu() {
        JTabbedPane tabbedPane = new JTabbedPane();

        JPanel filePanel = new JPanel(new GridLayout(1, 3, 10, 10));
        filePanel.add(createMenuButton("Создать", e -> createNewFile()));
        filePanel.add(createMenuButton("Открыть", e -> openFile()));
        filePanel.add(createMenuButton("Сохранить", e -> saveFile(true)));
        tabbedPane.addTab("Файл", filePanel);

        JPanel homePanel = new JPanel(new FlowLayout());

        String[] fonts = GraphicsEnvironment.getLocalGraphicsEnvironment().getAvailableFontFamilyNames();
        JComboBox<String> fontComboBox = new JComboBox<>(fonts);
        fontComboBox.setSelectedItem("Times New Roman");

        fontComboBox.addActionListener(e -> {
            String selectedFont = (String) fontComboBox.getSelectedItem();
            applyFont(selectedFont, -1);
        });

        Integer[] fontSizes = {8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30};
        JComboBox<Integer> sizeComboBox = new JComboBox<>(fontSizes);
        sizeComboBox.setSelectedItem(14);

        sizeComboBox.addActionListener(e -> {
            int selectedSize = (int) sizeComboBox.getSelectedItem();
            applyFont(null, selectedSize);
        });

        JPanel fontPanel = new JPanel(new FlowLayout(FlowLayout.LEFT));
        fontPanel.add(fontComboBox);
        fontPanel.add(sizeComboBox);
        homePanel.add(fontPanel);

        editorPane.addCaretListener(e -> {
            int start = editorPane.getSelectionStart();
            int end = editorPane.getSelectionEnd();

            if (start != end) {
                StyledDocument doc = (StyledDocument) editorPane.getDocument();

                String currentFont = null;
                int currentFontSize = -1;
                boolean multipleFonts = false;
                boolean multipleSizes = false;

                for (int i = start; i < end; i++) {
                    Element element = doc.getCharacterElement(i);
                    AttributeSet attributes = element.getAttributes();

                    String font = StyleConstants.getFontFamily(attributes);
                    if (currentFont == null) {
                        currentFont = font;
                    } else if (!currentFont.equals(font)) {
                        multipleFonts = true;
                    }

                    int fontSize = StyleConstants.getFontSize(attributes);
                    if (currentFontSize == -1) {
                        currentFontSize = fontSize;
                    } else if (currentFontSize != fontSize) {
                        multipleSizes = true;
                    }

                    if (multipleFonts && multipleSizes) {
                        break;
                    }
                }

                if (multipleFonts) {
                    fontComboBox.setSelectedItem(null);
                } else {
                    fontComboBox.setSelectedItem(currentFont);
                }

                if (multipleSizes) {
                    sizeComboBox.setSelectedItem(null);
                } else {
                    sizeComboBox.setSelectedItem(currentFontSize);
                }
            }
        });
        
        homePanel.add(createMenuButton("Формат по образцу", e -> copyFormat()));
        homePanel.add(createMenuButton("Применить формат", e -> applyFormat()));
        homePanel.add(createMenuButton("Полужирный", e -> toggleBold()));
        homePanel.add(createMenuButton("Курсив", e -> toggleItalic()));
        homePanel.add(createMenuButton("Подчеркнутый", e -> toggleUnderline()));
        homePanel.add(createMenuButton("Зачеркнутый", e -> toggleStrikethrough()));
        homePanel.add(createMenuButton("Подстрочный знак", e -> toggleSubscript()));
        homePanel.add(createMenuButton("Надстрочный знак", e -> toggleSuperscript()));
        homePanel.add(createMenuButton("Цвет шрифта", e -> changeTextColor()));
        homePanel.add(createMenuButton("Цвет фона", e -> changeBackgroundColor()));
        homePanel.add(createMenuButton("Очистить все форматирования", e -> clearFormatting()));
        homePanel.add(createMenuButton("Регистр", e -> toggleCase()));
        homePanel.add(createMenuButton("Уменьшить размер шрифта", e -> decreaseFontSize()));
        homePanel.add(createMenuButton("Увеличить размер шрифта", e -> increaseFontSize()));
        homePanel.add(createMenuButton("Маркеры", e -> toggleBullets()));
        homePanel.add(createMenuButton("Нумерация", e -> toggleNumbering()));
        homePanel.add(createMenuButton("Многоуровневая нумерация", e -> toggleMultilevelNumbering()));
        homePanel.add(createMenuButton("Заливка", e -> applyBackgroundFill()));

        tabbedPane.addTab("Главная", homePanel);

        JPanel editPanel = new JPanel(new GridLayout(3, 4, 10, 10));
        editPanel.add(createActionButton(new DefaultEditorKit.CutAction(), "Вырезать"));
        editPanel.add(createActionButton(new DefaultEditorKit.CopyAction(), "Копировать"));
        editPanel.add(createActionButton(new DefaultEditorKit.PasteAction(), "Вставить"));

        editPanel.add(createMenuButton("Найти", e -> findText()));
        editPanel.add(createMenuButton("Найти далее", e -> findNext()));
        editPanel.add(createMenuButton("Найти ранее", e -> findPrevious()));
        editPanel.add(createMenuButton("Заменить", e -> replaceText()));
        editPanel.add(createMenuButton("Перейти", e -> goToLine()));
        editPanel.add(createMenuButton("Выбрать все", e -> selectAllText()));
        editPanel.add(createMenuButton("Дата и время", e -> insertDateTime()));
        tabbedPane.addTab("Изменить", editPanel);

        frame.add(tabbedPane, BorderLayout.NORTH);
    }

    private static JButton createMenuButton(String text, ActionListener action) {
        JButton button = new JButton(text);
        button.addActionListener(action);
        return button;
    }

    private static JButton createActionButton(Action action, String text) {
        JButton button = new JButton(action);
        button.setText(text);
        return button;
    }

    private static void copyFormat() {
        int start = editorPane.getSelectionStart();
        int end = editorPane.getSelectionEnd();
        if (start != end) {
            StyledDocument doc = (StyledDocument) editorPane.getDocument();
            AttributeSet attributes = doc.getCharacterElement(start).getAttributes();
            copiedAttributes = new SimpleAttributeSet(attributes);
            JOptionPane.showMessageDialog(frame, "Формат скопирован.");
        } else {
            JOptionPane.showMessageDialog(frame, "Пожалуйста, выделите текст для копирования формата.");
        }
    }

    private static void applyFormat() {
        int start = editorPane.getSelectionStart();
        int end = editorPane.getSelectionEnd();
        if (start != end) {
            StyledDocument doc = (StyledDocument) editorPane.getDocument();
            doc.setCharacterAttributes(start, end - start, copiedAttributes, false);
            JOptionPane.showMessageDialog(frame, "Формат применен.");
        } else {
            JOptionPane.showMessageDialog(frame, "Пожалуйста, выделите текст для применения формата.");
        }
    }


    private static void toggleBold() {
        int start = editorPane.getSelectionStart();
        int end = editorPane.getSelectionEnd();

        if (start != end) {
            StyledDocument doc = (StyledDocument) editorPane.getDocument();
            SimpleAttributeSet attr = new SimpleAttributeSet();

            Element element = doc.getCharacterElement(start);
            AttributeSet attributes = element.getAttributes();
            boolean isBold = StyleConstants.isBold(attributes);

            StyleConstants.setBold(attr, !isBold);
            doc.setCharacterAttributes(start, end - start, attr, false);
        } else {
            JOptionPane.showMessageDialog(frame, "Пожалуйста, выделите текст для изменения стиля.");
        }
    }

    private static void toggleItalic() {
        int start = editorPane.getSelectionStart();
        int end = editorPane.getSelectionEnd();

        if (start != end) {
            StyledDocument doc = (StyledDocument) editorPane.getDocument();
            SimpleAttributeSet attr = new SimpleAttributeSet();

            Element element = doc.getCharacterElement(start);
            AttributeSet attributes = element.getAttributes();
            boolean isItalic = StyleConstants.isItalic(attributes);

            StyleConstants.setItalic(attr, !isItalic);
            doc.setCharacterAttributes(start, end - start, attr, false);
        } else {
            JOptionPane.showMessageDialog(frame, "Пожалуйста, выделите текст для изменения стиля.");
        }
    }

    private static void toggleUnderline() {
        int start = editorPane.getSelectionStart();
        int end = editorPane.getSelectionEnd();

        if (start != end) {
            StyledDocument doc = (StyledDocument) editorPane.getDocument();
            SimpleAttributeSet attr = new SimpleAttributeSet();

            Element element = doc.getCharacterElement(start);
            AttributeSet attributes = element.getAttributes();
            boolean isUnderlined = StyleConstants.isUnderline(attributes);

            StyleConstants.setUnderline(attr, !isUnderlined);
            doc.setCharacterAttributes(start, end - start, attr, false);
        } else {
            JOptionPane.showMessageDialog(frame, "Пожалуйста, выделите текст для изменения стиля.");
        }
    }

    private static void toggleStrikethrough() {
        int start = editorPane.getSelectionStart();
        int end = editorPane.getSelectionEnd();

        if (start != end) {
            StyledDocument doc = (StyledDocument) editorPane.getDocument();
            SimpleAttributeSet attr = new SimpleAttributeSet();

            Element element = doc.getCharacterElement(start);
            AttributeSet attributes = element.getAttributes();
            boolean isStrikethrough = StyleConstants.isStrikeThrough(attributes);

            StyleConstants.setStrikeThrough(attr, !isStrikethrough);
            doc.setCharacterAttributes(start, end - start, attr, false);
        } else {
            JOptionPane.showMessageDialog(frame, "Пожалуйста, выделите текст для изменения стиля.");
        }
    }

    private static void toggleSubscript() {
        int start = editorPane.getSelectionStart();
        int end = editorPane.getSelectionEnd();

        if (start != end) {
            StyledDocument doc = (StyledDocument) editorPane.getDocument();
            SimpleAttributeSet attr = new SimpleAttributeSet();

            Element element = doc.getCharacterElement(start);
            AttributeSet attributes = element.getAttributes();
            boolean isSubscript = StyleConstants.isSubscript(attributes);

            StyleConstants.setSubscript(attr, !isSubscript);
            doc.setCharacterAttributes(start, end - start, attr, false);
        } else {
            JOptionPane.showMessageDialog(frame, "Пожалуйста, выделите текст для изменения стиля.");
        }
    }

    private static void toggleSuperscript() {
        int start = editorPane.getSelectionStart();
        int end = editorPane.getSelectionEnd();

        if (start != end) {
            StyledDocument doc = (StyledDocument) editorPane.getDocument();
            SimpleAttributeSet attr = new SimpleAttributeSet();

            Element element = doc.getCharacterElement(start);
            AttributeSet attributes = element.getAttributes();
            boolean isSuperscript = StyleConstants.isSuperscript(attributes);

            StyleConstants.setSuperscript(attr, !isSuperscript);
            doc.setCharacterAttributes(start, end - start, attr, false);
        } else {
            JOptionPane.showMessageDialog(frame, "Пожалуйста, выделите текст для изменения стиля.");
        }
    }

    private static void clearFormatting() {
        int start = editorPane.getSelectionStart();
        int end = editorPane.getSelectionEnd();

        if (start != end) {
            StyledDocument doc = (StyledDocument) editorPane.getDocument();
            SimpleAttributeSet attr = new SimpleAttributeSet(); // Пустой набор атрибутов
            doc.setCharacterAttributes(start, end - start, attr, true);
            JOptionPane.showMessageDialog(frame, "Форматирование очищено.");
        } else {
            JOptionPane.showMessageDialog(frame, "Пожалуйста, выделите текст для очистки форматирования.");
        }
    }

    private static void toggleCase() {
        int start = editorPane.getSelectionStart();
        int end = editorPane.getSelectionEnd();

        if (start != end) {
            StyledDocument doc = (StyledDocument) editorPane.getDocument();
            try {
                String selectedText = doc.getText(start, end - start);

                boolean isUpperCase = selectedText.equals(selectedText.toUpperCase());

                String transformedText = isUpperCase ? selectedText.toLowerCase() : selectedText.toUpperCase();

                doc.remove(start, end - start);
                doc.insertString(start, transformedText, null);
            } catch (Exception e) {
                JOptionPane.showMessageDialog(frame, "Ошибка при изменении регистра.");
            }
        } else {
            JOptionPane.showMessageDialog(frame, "Пожалуйста, выделите текст для изменения регистра.");
        }
    }

    private static void decreaseFontSize() {
        int start = editorPane.getSelectionStart();
        int end = editorPane.getSelectionEnd();

        if (start != end) {
            StyledDocument doc = (StyledDocument) editorPane.getDocument();
            SimpleAttributeSet attr = new SimpleAttributeSet();

            Element element = doc.getCharacterElement(start);
            AttributeSet attributes = element.getAttributes();
            int currentFontSize = StyleConstants.getFontSize(attributes);

            int newFontSize = Math.max(currentFontSize - 2, 2);
            StyleConstants.setFontSize(attr, newFontSize);

            doc.setCharacterAttributes(start, end - start, attr, false);
        } else {
            JOptionPane.showMessageDialog(frame, "Пожалуйста, выделите текст для изменения размера шрифта.");
        }
    }

    private static void increaseFontSize() {
        int start = editorPane.getSelectionStart();
        int end = editorPane.getSelectionEnd();

        if (start != end) {
            StyledDocument doc = (StyledDocument) editorPane.getDocument();
            SimpleAttributeSet attr = new SimpleAttributeSet();

            Element element = doc.getCharacterElement(start);
            AttributeSet attributes = element.getAttributes();
            int currentFontSize = StyleConstants.getFontSize(attributes);

            int newFontSize = currentFontSize + 2;
            StyleConstants.setFontSize(attr, newFontSize);

            doc.setCharacterAttributes(start, end - start, attr, false);
        } else {
            JOptionPane.showMessageDialog(frame, "Пожалуйста, выделите текст для изменения размера шрифта.");
        }
    }

    private static void toggleBullets() {
        int start = editorPane.getSelectionStart();
        int end = editorPane.getSelectionEnd();

        if (start != end) {
            StyledDocument doc = (StyledDocument) editorPane.getDocument();
            try {
                String selectedText = doc.getText(start, end - start);
                AttributeSet originalAttributes = doc.getCharacterElement(start).getAttributes();

                String[] lines = selectedText.split("\n");

                boolean allLinesMarked = true;
                for (String line : lines) {
                    if (!line.trim().startsWith("•")) {
                        allLinesMarked = false;
                        break;
                    }
                }

                StringBuilder modifiedText = new StringBuilder();
                for (String line : lines) {
                    if (allLinesMarked) {
                        modifiedText.append(line.replaceFirst("•\\s*", "")).append("\n");
                    } else {
                        modifiedText.append("• ").append(line).append("\n");
                    }
                }

                doc.remove(start, end - start);
                doc.insertString(start, modifiedText.toString(), originalAttributes);
            } catch (Exception e) {
                JOptionPane.showMessageDialog(frame, "Ошибка при добавлении маркеров.");
            }
        } else {
            JOptionPane.showMessageDialog(frame, "Пожалуйста, выделите текст для добавления маркеров.");
        }
    }

    private static void toggleNumbering() {
        int start = editorPane.getSelectionStart();
        int end = editorPane.getSelectionEnd();

        if (start != end) {
            StyledDocument doc = (StyledDocument) editorPane.getDocument();
            try {
                String selectedText = doc.getText(start, end - start);
                AttributeSet originalAttributes = doc.getCharacterElement(start).getAttributes();

                String[] lines = selectedText.split("\n");

                boolean allLinesNumbered = true;
                for (String line : lines) {
                    if (!line.trim().matches("^\\d+\\.\\s.*")) {
                        allLinesNumbered = false;
                        break;
                    }
                }

                StringBuilder modifiedText = new StringBuilder();
                int lineNumber = 1;
                for (String line : lines) {
                    if (allLinesNumbered) {
                        modifiedText.append(line.replaceFirst("^\\d+\\.\\s*", "")).append("\n");
                    } else {
                        modifiedText.append(lineNumber).append(". ").append(line).append("\n");
                        lineNumber++;
                    }
                }

                doc.remove(start, end - start);
                doc.insertString(start, modifiedText.toString(), originalAttributes);
            } catch (Exception e) {
                JOptionPane.showMessageDialog(frame, "Ошибка при добавлении нумерации.");
            }
        } else {
            JOptionPane.showMessageDialog(frame, "Пожалуйста, выделите текст для добавления нумерации.");
        }
    }

    private static void toggleMultilevelNumbering() {
        int start = editorPane.getSelectionStart();
        int end = editorPane.getSelectionEnd();

        if (start != end) {
            StyledDocument doc = (StyledDocument) editorPane.getDocument();
            try {
                String selectedText = doc.getText(start, end - start);
                AttributeSet originalAttributes = doc.getCharacterElement(start).getAttributes();

                String[] lines = selectedText.split("\n");

                boolean allLinesNumbered = true;
                for (String line : lines) {
                    if (!line.trim().matches("^\\d+(\\.\\d+)*\\.\\s+.*")) {
                        allLinesNumbered = false;
                        break;
                    }
                }

                StringBuilder modifiedText = new StringBuilder();
                for (String line : lines) {
                    int indentLevel = countLeadingTabsOrSpaces(line);
                    if (allLinesNumbered) {
                        modifiedText.append(line.replaceFirst("^\\d+(\\.\\d+)*\\.\\s*", "")).append("\n");
                    } else {
                        String numbering = generateNumbering(indentLevel);
                        modifiedText.append(numbering).append(" ").append(line.trim()).append("\n");
                    }
                }

                doc.remove(start, end - start);
                doc.insertString(start, modifiedText.toString(), originalAttributes);
            } catch (Exception e) {
                JOptionPane.showMessageDialog(frame, "Ошибка при добавлении многоуровневой нумерации.");
            }
        } else {
            JOptionPane.showMessageDialog(frame, "Пожалуйста, выделите текст для добавления многоуровневой нумерации.");
        }
    }

    private static int countLeadingTabsOrSpaces(String line) {
        int count = 0;
        while (count < line.length() && (line.charAt(count) == ' ' || line.charAt(count) == '\t')) {
            count++;
        }
        return count;
    }

    private static String generateNumbering(int level) {
        StringBuilder numbering = new StringBuilder();
        for (int i = 1; i <= level + 1; i++) {
            numbering.append(i).append(".");
        }
        return numbering.toString();
    }

    private static void applyBackgroundFill() {
        Color newColor = JColorChooser.showDialog(frame, "Выберите цвет заливки", Color.YELLOW);
        if (newColor != null) {
            int start = editorPane.getSelectionStart();
            int end = editorPane.getSelectionEnd();

            if (start != end) {
                StyledDocument doc = (StyledDocument) editorPane.getDocument();
                SimpleAttributeSet attr = new SimpleAttributeSet();

                StyleConstants.setBackground(attr, newColor);
                doc.setCharacterAttributes(start, end - start, attr, false);
            } else {
                JOptionPane.showMessageDialog(frame, "Пожалуйста, выделите текст для применения заливки.");
            }
        }
    }

    private static void applyFont(String fontFamily, int fontSize) {
        int start = editorPane.getSelectionStart();
        int end = editorPane.getSelectionEnd();
        if (start != end) {
            StyledDocument doc = (StyledDocument) editorPane.getDocument();
            MutableAttributeSet attributes = new SimpleAttributeSet();

            if (fontFamily != null) {
                StyleConstants.setFontFamily(attributes, fontFamily);
            }
            if (fontSize != -1) {
                StyleConstants.setFontSize(attributes, fontSize);
            }

            doc.setCharacterAttributes(start, end - start, attributes, false);
        }
    }

    private static void loadSettings() {
        try (InputStream input = new FileInputStream("config.properties")) {
            settings.load(input);
        } catch (IOException e) {
            System.out.println("Не удалось загрузить настройки, используются значения по умолчанию.");
        }
    }

    static void addToolBar() {
        JToolBar toolBar = new JToolBar();
        toolBar.add(createMenuButton("Создать", e -> createNewFile()));
        toolBar.add(createMenuButton("Открыть", e -> openFile()));
        toolBar.add(createMenuButton("Сохранить", e -> saveFile(false)));
        editorPane.getDocument().addUndoableEditListener(undoManager);
        toolBar.add(createMenuButton("Отменить", e -> {
            if (undoManager.canUndo()) undoManager.undo();
        }));
        toolBar.add(createMenuButton("Вернуть", e -> {
            if (undoManager.canRedo()) undoManager.redo();
        }));
        toolBar.add(createMenuButton("Темная тема", e -> toggleTheme()));
        frame.add(toolBar, BorderLayout.NORTH);
    }

    private static void toggleTheme() {
        Color backgroundColor = editorPane.getBackground().equals(Color.BLACK) ? Color.WHITE : Color.BLACK;
        Color textColor = editorPane.getForeground().equals(Color.WHITE) ? Color.BLACK : Color.WHITE;
        editorPane.setBackground(backgroundColor);
        editorPane.setForeground(textColor);
    }

    private static void addContextMenu() {
        JPopupMenu contextMenu = new JPopupMenu();
        contextMenu.add(createMenuItem("Копировать", e -> editorPane.copy()));
        contextMenu.add(createMenuItem("Вставить", e -> editorPane.paste()));
        contextMenu.add(createMenuItem("Вырезать", e -> editorPane.cut()));
        contextMenu.add(createMenuItem("Выбрать все", e -> editorPane.selectAll()));
        editorPane.setComponentPopupMenu(contextMenu);
    }
}