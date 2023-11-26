<script>
    import '../style/global.css'
    import logo from '$lib/assets/logo.svg'
</script>


<div class="nav">
    <img src={logo} alt="BadNarrators Logo" width="25" height="25">
    <a href="/">Home</a>
    <a href="/munchkin">Munchkin</a>
    <a href="/about">About</a>
</div>


<div class='content'>
    <slot />
</div>


<style>
    a{
        color: #9643a4;
        transition: 0.3s;
        text-decoration: none;
        padding: 4px;
        background: none;
        text-align: center;
    }
    a:hover{
        color: #f3f3f3;
        background-color: #741287;
        border: #f3f3f3 1px solid;
        border-radius: 4px;
    }
    .nav{
        font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
        font-weight: bold;
        margin: auto;
        width: 50%;
        text-align: center;
        vertical-align: middle;
        padding: 10px 0;
    }
    .content{
        margin: 20px;
    }
</style>
