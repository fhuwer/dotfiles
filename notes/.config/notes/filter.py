#!/usr/bin/env python3
from panflute import run_filter, ListContainer, Div, Link, Str, Space
from datetime import datetime
import os.path


def prepare(doc):
    if os.path.isfile('index.md'):
        doc.metadata['title'].content.insert(0, Link(Str('↩'), url='index.html'))
        doc.metadata['title'].content.insert(1, Space())
    if 'date' in doc.metadata:
        doc.metadata['date'].content[0].text = datetime.now().strftime('%d.%m.%Y')


def finalize(doc):
    div = Div()
    div.attributes['class'] = 'main'
    list_container = ListContainer()
    div.content = doc.content
    list_container.append(div)
    doc.content = list_container

def main(doc=None):
    return run_filter(lambda x, y: None, doc=doc, prepare=prepare, finalize=finalize)


if __name__ == "__main__":
    main()
