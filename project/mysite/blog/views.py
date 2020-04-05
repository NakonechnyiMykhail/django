from django.shortcuts import render
from django.utils import timezone
from blog.models import Post
# Create your views here.

def index(request):
    return render(request, 'blog/index.html', {})


def post_list(request):
    title = 'Clean Blog'
    subtitle = 'A Blog Theme by Start Bootstrap'
    posts = Post.objects.filter(published_date__lte=timezone.now()).order_by('published_date')
    return render(request, 'blog/post_list.html', {
        'title':title,
        'subtitle':subtitle,
        'posts':posts,

    })


def about(request):
    title = 'About Me'
    subtitle = 'This is what I do.'
    return render(request, 'blog/about.html', {
        'title':title,
        'subtitle':subtitle,
    })

def contact(request):
    title = 'Contact Me'
    subtitle = 'Have questions? I have answers.'
    return render(request, 'blog/contact.html', {
        'title':title,
        'subtitle':subtitle,
    })

def post(request):
    title = Post.title
    subtitle = Post.description
    author = Post.author
    published_date = Post.published_date
    text = Post.text

    return render(request, 'blog/post.html', {
        'title':title,
        'subtitle':subtitle,
        'author': author,
        'published_date':published_date,
        'text':text,
    })