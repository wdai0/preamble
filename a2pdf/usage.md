# A script to convert a txt to pdf file

1. Adjust the flags if necessary. 

2. Make the script executable:

```zsh
chmod +x txt_to_pdf.zsh
```

3. Run the script with a `.txt` file as an argument:
```zsh
./txt_to_pdf.zsh input.txt
```

# Starting a new page

Pressing **Ctrl+L** in a text editor like Vim or Emacs will insert 
an actual form feed character.
This form feed character is a single, 
non-printable character that has special meaning to programs like `a2ps`.
