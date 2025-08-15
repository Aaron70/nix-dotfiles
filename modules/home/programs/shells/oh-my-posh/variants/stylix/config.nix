{ colors }:

''
  {
    "version": 2,
    "final_space": true,
    "console_title_template": "{{ .Shell }} in {{ .Folder }}",
    "blocks": [
      {
        "type": "prompt",
        "alignment": "left",
        "segments": [
          {
            "type": "path",
            "style": "plain",
            "background": "transparent",
            "foreground": "#${colors.base0A}",
            "template": "[ {{ .Path }} ]",
            "properties": {
              "style": "full"
            }
          },
          {
            "type": "git",
            "style": "plain",
            "foreground": "p:grey",
            "background": "transparent",
            "template": " {{ .HEAD }}{{ if or (.Working.Changed) (.Staging.Changed) }}*{{ end }} <cyan>{{ if gt .Behind 0 }}⇣{{ end }}{{ if gt .Ahead 0 }}⇡{{ end }}</>",
            "properties": {
              "branch_icon": "",
              "commit_icon": "@",
              "fetch_status": true
            }
          }
        ]
      },
      {
        "type": "prompt",
        "alignment": "left",
        "newline": true,
        "segments": [
          {
            "type": "os",
            "style": "plain",
            "foreground_templates": [
              "{{if gt .Code 0}}${colors.base0F}{{end}}",
              "{{if eq .Code 0}}${colors.base0A}{{end}}"
            ],
            "background": "transparent",
            "template": "{{.Icon}} "
          },
          {
            "type": "text",
            "style": "plain",
            "foreground_templates": [
              "{{if gt .Code 0}}#${colors.base0F}{{end}}",
              "{{if eq .Code 0}}#${colors.base0E}{{end}}"
            ],
            "background": "transparent",
            "template": "❯"
          }
        ]
      }
    ],
    "transient_prompt": {
      "foreground_templates": [
        "{{if gt .Code 0}}#${colors.base0F}{{end}}",
        "{{if eq .Code 0}}#${colors.base0E}{{end}}"
      ],
      "background": "transparent",
      "template": "❯ "
    },
    "secondary_prompt": {
      "foreground": "#${colors.base0E}",
      "background": "transparent",
      "template": "❯❯ "
    }
  }
''
