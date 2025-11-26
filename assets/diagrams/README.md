# Four Minds Pattern - Visual Assets

This directory contains visual diagrams for the Four Minds Pattern.

## Mermaid Diagrams

Mermaid diagrams render automatically on GitHub and can be converted to PNG/SVG using:
- **GitHub**: View directly in markdown
- **Mermaid Live Editor**: https://mermaid.live/ (paste code, export PNG/SVG)
- **mermaid-cli**: `mmdc -i file.mmd -o file.png`

### Available Diagrams

1. **directory-hierarchy.mmd**
   - Shows the directory structure and Mind placement
   - Use for: README, technical docs, presentations

2. **four-minds-roles.mmd**
   - Shows the four Minds and their responsibilities
   - Use for: Overview slides, social media, blog header

3. **traditional-vs-fourminds.mmd**
   - Compares single AI vs Four Minds approach
   - Use for: Marketing, problem/solution framing

4. **context-visibility.mmd**
   - Shows what each Mind can see
   - Use for: Technical explanation, architecture docs

## Converting to Images

### Using Mermaid Live Editor (Easiest)

1. Go to https://mermaid.live/
2. Paste the contents of any .mmd file
3. Click "Export" → PNG or SVG
4. Download and use

### Using mermaid-cli

```bash
# Install
npm install -g @mermaid-js/mermaid-cli

# Convert all diagrams
for file in *.mmd; do
    mmdc -i "$file" -o "${file%.mmd}.png" -b transparent
done
```

### Using GitHub Actions (Automated)

We can set up a GitHub Action to automatically generate PNGs from .mmd files on commit.

## Diagram Specifications

### Color Scheme

- **Highest Self**: Light Blue (#e1f5fe / #0277bd)
- **Mentor**: Light Orange (#fff3e0 / #f57c00)
- **Peer**: Light Purple (#f3e5f5 / #7b1fa2)
- **Developer**: Light Green (#c8e6c9 / #388e3c)

### Icons Used

- 🏠 Home/Highest Self
- 🎓 Mentor/Teaching
- 🧪 Peer/Experimentation
- ⚙️ Developer/Implementation
- 📂 Directories
- ✨ Insights/Wisdom
- 🔧 Tools
- 📋 Planning

## Usage Guidelines

### README Hero Image

Use `directory-hierarchy.mmd` or `four-minds-roles.mmd` converted to PNG as the hero image at the top of README.

### Blog Post Header

Use `traditional-vs-fourminds.mmd` to show the problem/solution.

### Social Media

- **Twitter/X**: Square crop of `four-minds-roles.mmd`
- **LinkedIn**: Wide format of `four-minds-roles.mmd`
- **YouTube Thumbnail**: `directory-hierarchy.mmd` with text overlay

### Presentations

All diagrams are suitable for presentations. Export as SVG for best quality on slides.

## Future Additions

Planned visual assets:

- [ ] Terminal screenshot mockup
- [ ] Animated GIF of workflow
- [ ] Infographic comparing with traditional multi-agent patterns
- [ ] Social media card templates
- [ ] YouTube thumbnail template
- [ ] Pattern poster (printable)

## Contributing Graphics

If you create enhanced versions of these diagrams (Figma, Sketch, etc.), please:

1. Export to PNG (high res) and SVG
2. Place in appropriate subdirectory
3. Update this README with usage notes
4. Maintain the established color scheme
