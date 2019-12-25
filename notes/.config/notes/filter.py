#!/usr/bin/env python3
from panflute import run_filter, ListContainer, Div


def finalize(doc):
    div = Div()
    div.attributes['class'] = 'main'
    list_container = ListContainer()
    div.content = doc.content
    list_container.append(div)
    doc.content = list_container

def main(doc=None):
    return run_filter(lambda x, y: None, doc=doc, finalize=finalize)


if __name__ == "__main__":
    main()
