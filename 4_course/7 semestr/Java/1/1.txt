package mk;

import javax.swing.*;
import java.awt.*;
import java.util.regex.*;

public class Mk {
    static final JFrame frame = new JFrame("FIO Transformation");

    static final String[] options = {
            "Фамилия Имя Отчество",
            "ФАМИЛИЯ ИМЯ ОТЧЕСТВО",
            "Имя Отчество ФАМИЛИЯ",
            "Фамилия И.О.",
            "ФАМИЛИЯ И.О."
    };

    static final JComboBox<String> formatComboBox = new JComboBox<>(options);

    static final JTextArea textArea = new JTextArea("На встрече были: Иванов Иван Иванович, Сидоров Петр Петрович и Петрова Мария Ивановна. Кроме того, имеется информация о студентах: Смирнов С. С. и Кузнецова А. А");

    static String originalText;
    static boolean isInitialFormat = true;

    public static void main(String[] args) {
        originalText = textArea.getText();

        textArea.setLineWrap(true);
        textArea.setWrapStyleWord(true);

        frame.setBounds(0, 0, 815, 600);
        frame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);
        frame.setLayout(null);

        JScrollPane scrollPane = new JScrollPane(textArea);
        scrollPane.setBounds(10, 10, 780, 500);
        frame.add(scrollPane);

        Font font = new Font("Arial", Font.BOLD, 14);

        formatComboBox.setBounds(330, 520, 200, 40);
        formatComboBox.setFont(font);
        frame.add(formatComboBox);

        frame.setLocationRelativeTo(null);

        formatComboBox.addActionListener(e -> {
            String selectedFormat = (String) formatComboBox.getSelectedItem();
            if (!isInitialFormat && (selectedFormat.equals("Фамилия Имя Отчество") || 
                                     selectedFormat.equals("ФАМИЛИЯ ИМЯ ОТЧЕСТВО") || 
                                     selectedFormat.equals("Имя Отчество ФАМИЛИЯ"))) {
                JOptionPane.showMessageDialog(frame, "Нельзя перейти на этот формат!");
                formatComboBox.setSelectedItem(getCurrentFormat());
                return;
            }

            textArea.setText(originalText);
            switch (selectedFormat) {
                case "Фамилия Имя Отчество":
                    onFirstOptionClickSelected();
                    break;
                case "ФАМИЛИЯ ИМЯ ОТЧЕСТВО":
                    onSecondOptionClickSelected();
                    break;
                case "Имя Отчество ФАМИЛИЯ":
                    onThirdOptionClickSelected();
                    break;
                case "Фамилия И.О.":
                    onFourthOptionClickSelected();
                    isInitialFormat = false;
                    break;
                case "ФАМИЛИЯ И.О.":
                    onFifthOptionClickSelected();
                    isInitialFormat = false;
                    break;
                default:
                    break;
            }
        });

        frame.setVisible(true);
    }

    static String getCurrentFormat() {
        return (String) formatComboBox.getSelectedItem();
    }

    static void onFirstOptionClickSelected() {
        String text = textArea.getText();
        String regex = "(\\p{Lu}\\p{Ll}+|\\p{Lu}+) (\\p{Lu}\\p{Ll}+|\\p{Lu}+) (\\p{Lu}\\p{Ll}+|\\p{Lu}+)";
        Pattern pattern = Pattern.compile(regex);

        Matcher matcher = pattern.matcher(text);
        StringBuffer resultText = new StringBuffer();
        while (matcher.find()) {
            String lastName = matcher.group(1);
            String firstName = matcher.group(2);
            String middleName = matcher.group(3);

            String formattedName = capitalize(lastName) + " " + capitalize(firstName) + " " + capitalize(middleName);
            matcher.appendReplacement(resultText, formattedName);
        }
        matcher.appendTail(resultText);
        textArea.setText(resultText.toString());
    }

    static void onSecondOptionClickSelected() {
        String text = textArea.getText();
        String regex = "(\\p{Lu}\\p{Ll}+) (\\p{Lu}\\p{Ll}+|\\p{Lu}+|\\p{Lu}\\.) ?(\\p{Lu}\\p{Ll}+|\\p{Lu}\\.|\\p{Lu}+)";
        Pattern pattern = Pattern.compile(regex);

        Matcher matcher = pattern.matcher(text);
        StringBuffer resultText = new StringBuffer();
        while (matcher.find()) {
            String lastName = matcher.group(1);
            String firstName = matcher.group(2);
            String middleName = matcher.group(3);

            String formattedName = lastName.toUpperCase() + " " + firstName.toUpperCase() + " " + middleName.toUpperCase();
            matcher.appendReplacement(resultText, formattedName);
        }
        matcher.appendTail(resultText);
        textArea.setText(resultText.toString());
    }

    static void onThirdOptionClickSelected() {
        String text = textArea.getText();
        String regex = "(\\p{Lu}\\p{Ll}+|\\p{Lu}+) (\\p{Lu}\\p{Ll}+|\\p{Lu}+) (\\p{Lu}\\p{Ll}+|\\p{Lu}+)";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(text);
        StringBuffer resultText = new StringBuffer();

        while (matcher.find()) {
            String lastName = matcher.group(1);
            String firstName = matcher.group(2);
            String middleName = matcher.group(3);

            String formattedName = capitalize(firstName) + " " + capitalize(middleName) + " " + lastName.toUpperCase();
            matcher.appendReplacement(resultText, formattedName);
        }
        matcher.appendTail(resultText);
        textArea.setText(resultText.toString());
    }

    static void onFourthOptionClickSelected() {
        String text = textArea.getText();
        String regex = "(\\p{Lu}\\p{Ll}+|\\p{Lu}+) (\\p{Lu}\\p{Ll}+|\\p{Lu}+|\\p{Lu}\\.) ?(\\p{Lu}\\p{Ll}+|\\p{Lu}\\.|\\p{Lu}+)";
        Pattern pattern = Pattern.compile(regex);

        Matcher matcher = pattern.matcher(text);
        StringBuffer resultText = new StringBuffer();
        while (matcher.find()) {
            String lastName = matcher.group(1);
            String firstName = matcher.group(2);
            String middleName = matcher.group(3);

            String formattedFirstName = firstName.substring(0, 1).toUpperCase() + ".";
            String formattedMiddleName = middleName.substring(0, 1).toUpperCase() + ".";
            String formattedName = capitalize(lastName) + " " + formattedFirstName + formattedMiddleName;

            matcher.appendReplacement(resultText, formattedName);
        }
        matcher.appendTail(resultText);
        textArea.setText(resultText.toString());
    }

    static void onFifthOptionClickSelected() {
        String text = textArea.getText();
        String regex = "(\\p{Lu}\\p{Ll}+|\\p{Lu}+) (\\p{Lu}\\p{Ll}+|\\p{Lu}+|\\p{Lu}\\.) ?(\\p{Lu}\\p{Ll}+|\\p{Lu}\\.|\\p{Lu}+)";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(text);

        StringBuffer resultText = new StringBuffer();
        while (matcher.find()) {
            String lastName = matcher.group(1);
            String firstName = matcher.group(2);
            String middleName = matcher.group(3);

            String formattedFirstName = firstName.substring(0, 1).toUpperCase() + ".";
            String formattedMiddleName = middleName.substring(0, 1).toUpperCase() + ".";
            String formattedName = lastName.toUpperCase() + " " + formattedFirstName + formattedMiddleName;

            matcher.appendReplacement(resultText, formattedName);
        }
        matcher.appendTail(resultText);
        textArea.setText(resultText.toString());
    }

    public static String capitalize(String word) {
        if (word == null || word.isEmpty()) {
            return word;
        }
        return word.substring(0, 1).toUpperCase() + word.substring(1).toLowerCase();
    }
}